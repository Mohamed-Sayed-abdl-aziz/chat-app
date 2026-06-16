import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/search/data/firebase/search_firebase.dart';
import 'package:chat_app/features/search/data/model/search_user_dto.dart';
import 'package:chat_app/features/search/domain/repo/data_source/search_data_source.dart';

class SearchDataSourceImp implements SearchDataSource {
  SearchDataSourceImp({required SearchFirebase firebase})
    : _firebase = firebase;

  final SearchFirebase _firebase;

  @override
  Stream<ResultFirebase<List<SearchUserDto>>> searchByName(String query) =>
      _firebase.searchByName(query);
}

SearchDataSource searchDataSourceInjectable() =>
    SearchDataSourceImp(firebase: SearchFirebase());
