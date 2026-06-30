import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/firebase/chat_firebase.dart';
import 'package:chat_app/features/chat/data/model/message_dto.dart';
import 'package:chat_app/features/chat/domain/repo/data_source/chat_data_source.dart';

class ChatDataSourceImp implements ChatDataSource {
  ChatDataSourceImp({required ChatFirebase firebase}) : _firebase = firebase;

  final ChatFirebase _firebase;
  @override
  Stream<ResultFirebase<List<MessageDto>>> getMessages(String chatId) {
    return _firebase.getMessages(chatId);
  }

  @override
  Future<ResultFirebase<bool>> sendMessage(
    String chatId,
    MessageDto message,
    List<String> chatMembers,
    String senderName,
    String receiverName,
  ) {
    return _firebase.sendMessage(
      chatId,
      message,
      chatMembers,
      senderName,
      receiverName,
    );
  }
}

ChatDataSource chatDataSourceInjectable() =>
    ChatDataSourceImp(firebase: ChatFirebase());
