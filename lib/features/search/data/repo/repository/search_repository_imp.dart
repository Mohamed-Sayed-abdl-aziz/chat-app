import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/search/data/model/search_user_dto.dart';
import 'package:chat_app/features/search/data/repo/data_source/search_data_source_imp.dart';
import 'package:chat_app/features/search/domain/entity/search_user_entity.dart';
import 'package:chat_app/features/search/domain/repo/data_source/search_data_source.dart';
import 'package:chat_app/features/search/domain/repo/repository/search_repository.dart';

class SearchRepositoryImp implements SearchRepository {
  SearchRepositoryImp({required SearchDataSource source}) : _source = source;

  final SearchDataSource _source;
  @override
  Stream<ResultFirebase<List<SearchUserEntity>>> searchByName(String query) {
    return _source.searchByName(query).map((resulte) {
      switch (resulte) {
        case Success<List<SearchUserDto>>():
          final entitys = resulte.data.map((dto) => dto.toEntity()).toList();
          return Success(entitys);
        case Error<List<SearchUserDto>>():
          return Error(resulte.error);
      }
    });
  }
}

SearchRepository searchRepositoryInjectable() =>
    SearchRepositoryImp(source: searchDataSourceInjectable());
