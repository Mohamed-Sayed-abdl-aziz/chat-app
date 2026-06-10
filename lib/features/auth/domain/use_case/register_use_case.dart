import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/domain/entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/repo/repository/register_repository.dart';

class RegisterUseCase {
  RegisterUseCase({required RegisterRepository repo}) : _repo = repo;

  final RegisterRepository _repo;

  Future<ResultFirebase<UserEntity>> invok() => _repo.register();
}

// GetNewsUseCase getNewsUseCaseInject() =>
//     GetNewsUseCase(homeRepositoryinjectable());
