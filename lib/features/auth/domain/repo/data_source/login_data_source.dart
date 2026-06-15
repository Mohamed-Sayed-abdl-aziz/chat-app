import 'package:chat_app/core/network/resulet_firebase.dart';

abstract interface class LoginDataSource {
  Future<ResultFirebase<bool>> logIn({
    required String email,
    required String password,
  });
}
