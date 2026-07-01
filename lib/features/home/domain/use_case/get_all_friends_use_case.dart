import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/home/data/repo/repository/get_all_firends_repository_imp.dart';
import 'package:chat_app/features/home/domain/entity/chat_card_entity.dart';
import 'package:chat_app/features/home/domain/repo/repository/get_all_friends_repository.dart';

class GetAllFriendsUseCase {
  GetAllFriendsUseCase({required GetAllFriendsRepository repo}) : _repo = repo;

  final GetAllFriendsRepository _repo;

  Stream<ResultFirebase<List<ChatCardEntity>>> invoke() => _repo.getFriends();
}

GetAllFriendsUseCase getAllFriendsUseCaseInjectable() =>
    GetAllFriendsUseCase(repo: getAllFriendsRepositoryInjectable());
