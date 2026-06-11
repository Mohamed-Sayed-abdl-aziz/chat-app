import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/repo/data_source/register_data_source_imp.dart';
import 'package:chat_app/features/auth/domain/entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/repo/data_source/register_data_source.dart';
import 'package:chat_app/features/auth/domain/repo/repository/register_repository.dart';

class RegisterRepositoryImp implements RegisterRepository {
  RegisterRepositoryImp({required RegisterDataSource dataSource})
    : _dataSource = dataSource;
  final RegisterDataSource _dataSource;

  @override
  Future<ResultFirebase<bool>> register(UserEntity user) async {
    final resulte = await _dataSource.register(user);
    switch (resulte) {
      case Success<bool>():
        return Success(true);
      case Error<bool>():
        return Error(resulte.error);
    }
  }
}

RegisterRepository registerRepositoryInjectable() =>
    RegisterRepositoryImp(dataSource: registerDataSourceInjectable());
