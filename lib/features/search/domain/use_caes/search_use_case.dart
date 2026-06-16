import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/search/data/repo/repository/search_repository_imp.dart';
import 'package:chat_app/features/search/domain/entity/search_user_entity.dart';
import 'package:chat_app/features/search/domain/repo/repository/search_repository.dart';

class SearchUseCase {
  SearchUseCase({required SearchRepository repo}) : _repo = repo;
  final SearchRepository _repo;
  Stream<ResultFirebase<List<SearchUserEntity>>> invoke(String query) =>
      _repo.searchByName(query);
}

SearchUseCase searchUseCaseInject() =>
    SearchUseCase(repo: searchRepositoryInjectable());
