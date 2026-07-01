import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/model/chat_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetAllFriendsFirebase {
  Stream<ResultFirebase<List<ChatDto>>> getFriends() {
    try {
      final String? cuurntUserId = FirebaseAuth.instance.currentUser?.uid;
      return FirebaseFirestore.instance
          .collection("chats")
          .where("users", arrayContains: cuurntUserId)
          .snapshots()
          .map((snapshot) {
            List<ChatDto> chats = snapshot.docs.map((doc) {
              return ChatDto.fromJson(doc);
            }).toList();

            if (chats.isEmpty) {
              return Success([]);
            }
            return Success(chats);
          });
    } catch (e) {
      return Stream.value(Error(e.toString()));
    }
  }
}
