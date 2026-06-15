import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/firebase/Auth_firebase.dart';
import 'package:chat_app/features/auth/data/model/user_model.dart';
import 'package:chat_app/features/auth/domain/entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/repo/data_source/register_data_source.dart';

class RegisterDataSourceImp implements RegisterDataSource {
  RegisterDataSourceImp({required AuthFirebase authFirebase})
    : _authFirebase = authFirebase;

  final AuthFirebase _authFirebase;

  @override
  Future<ResultFirebase<bool>> register(UserEntity user) async {
    final resulte = await _authFirebase.register(
      user: UserModel(
        email: user.email,
        password: user.password,
        phoneNumber: user.phoneNumber,
        name: user.name,
      ),
    );

    switch (resulte) {
      case Success<bool>():
        return Success(true);
      case Error<bool>():
        return Error(resulte.error);
    }
  }
}

RegisterDataSource registerDataSourceInjectable() =>
    RegisterDataSourceImp(authFirebase: AuthFirebase());
