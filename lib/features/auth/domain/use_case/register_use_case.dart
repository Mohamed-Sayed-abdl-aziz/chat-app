import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/repo/repository/register_repository_imp.dart';
import 'package:chat_app/features/auth/domain/entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/repo/repository/register_repository.dart';

class RegisterUseCase {
  RegisterUseCase({required RegisterRepository repo}) : _repo = repo;

  final RegisterRepository _repo;

  Future<ResultFirebase<bool>> invok(UserEntity user) => _repo.register(user);
}

RegisterUseCase registerUseCaseinjectable() =>
    RegisterUseCase(repo: registerRepositoryInjectable());
