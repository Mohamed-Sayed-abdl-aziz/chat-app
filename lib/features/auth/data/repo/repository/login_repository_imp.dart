import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/model/user_model.dart';
import 'package:chat_app/features/auth/data/repo/data_source/login_data_source_imp.dart';
import 'package:chat_app/features/auth/domain/repo/data_source/login_data_source.dart';
import 'package:chat_app/features/auth/domain/repo/repository/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  LoginRepositoryImp({required LoginDataSource dataSource})
    : _dataSource = dataSource;
  final LoginDataSource _dataSource;

  @override
  Future<ResultFirebase<bool>> login(UserModel user) async {
    final resulte = await _dataSource.login(user);
    switch (resulte) {
      case Success<bool>():
        return Success(true);
      case Error<bool>():
        return Error(resulte.error);
    }
  }
}

LoginRepository loginRepositoryInjectable() =>
    LoginRepositoryImp(dataSource: loginDataSourceInjectable());
