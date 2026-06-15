import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/firebase/Auth_firebase.dart';
import 'package:chat_app/features/auth/domain/repo/data_source/login_data_source.dart';

class LoginDataSourceImp implements LoginDataSource {
  LoginDataSourceImp({required AuthFirebase authFirebase})
    : _authFirebase = authFirebase;
  final AuthFirebase _authFirebase;
  @override
  Future<ResultFirebase<bool>> logIn({
    required String email,
    required String password,
  }) async {
    final resulte = await _authFirebase.logIn(email: email, password: password);
    switch (resulte) {
      case Success<bool>():
        return Success(true);
      case Error<bool>():
        return Error(resulte.error);
    }
  }
}

LoginDataSource loginDataSourceInjectable() =>
    LoginDataSourceImp(authFirebase: AuthFirebase());
