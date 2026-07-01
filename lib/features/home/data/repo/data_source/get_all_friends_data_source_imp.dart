import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/model/chat_dto.dart';
import 'package:chat_app/features/home/data/firebase/get_all_friends_firebase.dart';
import 'package:chat_app/features/home/domain/repo/data_source/get_all_friends_data_source.dart';

class GetAllFriendsDataSourceImp implements GetAllFriendsDataSource {
  GetAllFriendsDataSourceImp({required GetAllFriendsFirebase firebase})
    : _firebase = firebase;

  final GetAllFriendsFirebase _firebase;
  @override
  Stream<ResultFirebase<List<ChatDto>>> getFriends() => _firebase.getFriends();
}

GetAllFriendsDataSource getAllFriendsDataSourcInjectable() =>
    GetAllFriendsDataSourceImp(firebase: GetAllFriendsFirebase());
