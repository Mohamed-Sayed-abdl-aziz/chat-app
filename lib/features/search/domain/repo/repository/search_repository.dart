import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/search/domain/entity/search_user_entity.dart';

abstract interface class SearchRepository {
  Stream<ResultFirebase<List<SearchUserEntity>>> searchByName(String query);
}
