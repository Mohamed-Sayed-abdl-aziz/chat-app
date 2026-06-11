import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/domain/entity/user_entity.dart';

abstract interface class LoginDataSource {
  Future<ResultFirebase<bool>> login(UserEntity user);
}
