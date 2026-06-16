import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/search/data/model/search_user_dto.dart';

abstract interface class SearchDataSource {
  Stream<ResultFirebase<List<SearchUserDto>>> searchByName(String query);
}
