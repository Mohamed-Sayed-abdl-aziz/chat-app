import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/model/chat_dto.dart';

abstract interface class GetAllFriendsDataSource {
  Stream<ResultFirebase<List<ChatDto>>> getFriends();
}
