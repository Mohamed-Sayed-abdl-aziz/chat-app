import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/model/message_dto.dart';
import 'package:chat_app/features/chat/data/repo/data_source/chat_data_source_imp.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:chat_app/features/chat/domain/repo/data_source/chat_data_source.dart';
import 'package:chat_app/features/chat/domain/repo/repository/chat_repository.dart';

class ChatRepositoryImp implements ChatRepository {
  ChatRepositoryImp({required ChatDataSource source}) : _source = source;

  final ChatDataSource _source;
  @override
  Stream<ResultFirebase<List<MessageEntity>>> getMessages(String chatId) {
    return _source.getMessages(chatId).map((snapshot) {
      switch (snapshot) {
        case Success<List<MessageDto>>():
          final List<MessageEntity> messages = snapshot.data
              .map((dto) => dto.toEntity())
              .toList();
          return Success(messages);
        case Error<List<MessageDto>>():
          return Error(snapshot.error);
      }
    });
  }

  @override
  Future<ResultFirebase<bool>> sendMessage(
    String chatId,
    MessageEntity message,
    List<String> chatMembers,
    String senderName,
    String receiverName,
  ) {
    return _source.sendMessage(
      chatId,
      MessageDto(
        text: message.text,
        senderId: message.senderId,
        date: message.date,
        receiverId: message.receiverId,
      ),
      chatMembers,
      senderName,
      receiverName,
    );
  }
}

ChatRepository chatRepositoryInjectable() =>
    ChatRepositoryImp(source: chatDataSourceInjectable());
