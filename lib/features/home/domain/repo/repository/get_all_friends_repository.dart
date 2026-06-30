import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/home/domain/entity/chat_card_entity.dart';

abstract interface class GetAllFriendsRepository {
  Stream<ResultFirebase<List<ChatCardEntity>>> getFriends();
}
