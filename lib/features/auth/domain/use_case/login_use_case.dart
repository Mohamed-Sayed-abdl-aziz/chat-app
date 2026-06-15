import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/repo/repository/login_repository_imp.dart';
import 'package:chat_app/features/auth/domain/repo/repository/login_repository.dart';

class LoginUseCase {
  LoginUseCase({required LoginRepository repo}) : _repo = repo;

  final LoginRepository _repo;

  Future<ResultFirebase<bool>> invok({
    required String email,
    required String password,
  }) => _repo.logIn(email: email, password: password);
}

LoginUseCase loginUseCaseinjectable() =>
    LoginUseCase(repo: loginRepositoryInjectable());
