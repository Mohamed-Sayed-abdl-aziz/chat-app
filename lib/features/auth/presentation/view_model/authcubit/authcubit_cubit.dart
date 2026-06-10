import 'package:bloc/bloc.dart';
import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/domain/entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_case/register_use_case.dart';
import 'package:meta/meta.dart';

part 'authcubit_state.dart';

class AuthcubitCubit extends Cubit<AuthcubitState> {
  AuthcubitCubit({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
  }) : _registerUseCase = registerUseCase,
       _loginUseCase = loginUseCase,
       super(AuthcubitInitial());
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  Future<void> login() async {
    emit(AuthLoading());
    final resulet = await _loginUseCase.invok();

    switch (resulet) {
      case Success<UserEntity>():
        emit(LoginSuccess());
      case Error<UserEntity>():
        emit(AuthError(resulet.error));
    }
  }

  Future<void> register() async {
    emit(AuthLoading());
    final resulet = await _registerUseCase.invok();

    switch (resulet) {
      case Success<UserEntity>():
        emit(RegisterSuccess());
      case Error<UserEntity>():
        emit(AuthError(resulet.error));
    }
  }
}
