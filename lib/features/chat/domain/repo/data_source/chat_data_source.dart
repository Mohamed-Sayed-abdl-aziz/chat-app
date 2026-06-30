import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/model/message_dto.dart';

abstract interface class ChatDataSource {
  Stream<ResultFirebase<List<MessageDto>>> getMessages(String chatId);
  Future<ResultFirebase<bool>> sendMessage(
    String chatId,
    MessageDto message,
    List<String> chatMembers,
    String senderName,
    String receiverName,
  );
}
