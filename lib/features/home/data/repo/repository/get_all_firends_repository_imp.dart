import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/model/chat_dto.dart';
import 'package:chat_app/features/home/data/repo/data_source/get_all_friends_data_source_imp.dart';
import 'package:chat_app/features/home/domain/entity/chat_card_entity.dart';
import 'package:chat_app/features/home/domain/repo/data_source/get_all_friends_data_source.dart';
import 'package:chat_app/features/home/domain/repo/repository/get_all_friends_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetAllFirendsRepositoryImp implements GetAllFriendsRepository {
  GetAllFirendsRepositoryImp({required GetAllFriendsDataSource source})
    : _source = source;

  final GetAllFriendsDataSource _source;

  @override
  Stream<ResultFirebase<List<ChatCardEntity>>> getFriends() {
    final resulte = _source.getFriends();
    final String myUid = FirebaseAuth.instance.currentUser?.uid ?? "";
    return resulte.map((snapshot) {
      switch (snapshot) {
        case Success<List<ChatDto>>():
          final List<ChatCardEntity> chats = snapshot.data.map((chat) {
            final String friendId = chat.users!.firstWhere(
              (id) => id != myUid,
              orElse: () => "",
            );
            final String displayName = chat.users?.indexOf(myUid) == 0
                ? chat.receiverName!
                : chat.senderName!;

            return ChatCardEntity(
              lastMessage: chat.message ?? "",
              lastMessageDate: chat.lastMessageDate ?? "",
              friendName: displayName,
              friendId: friendId,
            );
          }).toList();
          return Success(chats);
        case Error<List<ChatDto>>():
          return Error(snapshot.error);
      }
    });
  }
}

GetAllFriendsRepository getAllFriendsRepositoryInjectable() =>
    GetAllFirendsRepositoryImp(source: getAllFriendsDataSourcInjectable());
