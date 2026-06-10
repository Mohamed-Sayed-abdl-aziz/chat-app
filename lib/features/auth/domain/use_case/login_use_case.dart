import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/domain/entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/repo/repository/login_repository.dart';

class LoginUseCase {
  LoginUseCase({required LoginRepository repo}) : _repo = repo;

  final LoginRepository _repo;

  Future<ResultFirebase<UserEntity>> invok() => _repo.login();
}

// GetNewsUseCase getNewsUseCaseInject() =>
//     GetNewsUseCase(homeRepositoryinjectable());
