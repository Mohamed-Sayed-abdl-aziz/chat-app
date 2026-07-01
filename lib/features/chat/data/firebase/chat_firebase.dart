import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/model/message_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebase {
  Stream<ResultFirebase<List<MessageDto>>> getMessages(String chatId) {
    return FirebaseFirestore.instance
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy("date", descending: true)
        .snapshots()
        .map((snapshot) {
          final messages = snapshot.docs.map((dto) {
            return MessageDto.fromJson(dto.data());
          }).toList();
          return Success(messages);
        })
        .handleError((error) {
          return Error(error.toString());
        });
  }

  Future<ResultFirebase<bool>> sendMessage(
    String chatId,
    MessageDto message,
    List<String> chatMembers,
    String senderName,
    String receiverName,
  ) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final batch = firestore.batch();

      final chatDocRef = firestore.collection("chats").doc(chatId);

      final messageDocRef = chatDocRef.collection("messages").doc();

      batch.set(chatDocRef, {
        "chatId": chatId,
        "users": chatMembers,
        "message": message.text,
        "lastMessageDate": message.date,
        "senderName": senderName,
        "receiverName": receiverName,
      }, SetOptions(merge: true));

      batch.set(messageDocRef, message.toJson());

      await batch.commit();

      return Success(true);
    } catch (e) {
      return Error(e.toString());
    }
  }
}
