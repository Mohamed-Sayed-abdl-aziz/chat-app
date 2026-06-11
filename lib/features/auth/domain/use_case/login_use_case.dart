import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/model/user_model.dart';
import 'package:chat_app/features/auth/data/repo/repository/login_repository_imp.dart';
import 'package:chat_app/features/auth/domain/repo/repository/login_repository.dart';

class LoginUseCase {
  LoginUseCase({required LoginRepository repo}) : _repo = repo;

  final LoginRepository _repo;

  Future<ResultFirebase<bool>> invok(UserModel user) => _repo.login(user);
}

LoginUseCase loginUseCaseinjectable() =>
    LoginUseCase(repo: loginRepositoryInjectable());
