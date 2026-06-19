import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';

abstract interface class ChatRepository {
  Stream<ResultFirebase<List<MessageEntity>>> getMessages(String chatId);
  Future<ResultFirebase<bool>> sendMessage(
    String chatId,
    MessageEntity message,
    List<String> chatMembers,
  );
}
