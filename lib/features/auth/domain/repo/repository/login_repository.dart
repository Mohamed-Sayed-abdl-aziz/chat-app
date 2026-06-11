import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/model/user_model.dart';

abstract interface class LoginRepository {
  Future<ResultFirebase<bool>> login(UserModel user);
}
