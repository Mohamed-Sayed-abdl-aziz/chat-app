import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/search/data/model/search_user_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchFirebase {
  Stream<ResultFirebase<List<SearchUserDto>>> searchByName(String query) {
    if (query.isEmpty) {
      return Stream.value(Success([]));
    }

    try {
      return FirebaseFirestore.instance
          .collection("users")
          .where("name", isGreaterThanOrEqualTo: query)
          .where("name", isLessThanOrEqualTo: '$query\uf8ff')
          .snapshots()
          .map((snapshot) {
            List<SearchUserDto> users = snapshot.docs
                .map((doc) => SearchUserDto.fromJson(doc.data()))
                .toList();
            return Success(users);
          });
    } catch (e) {
      return Stream.value(Error(e.toString()));
    }
  }
}
