import 'package:bloc/bloc.dart';
import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/domain/entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_case/register_use_case.dart';
import 'package:meta/meta.dart';

part 'authcubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
  }) : _registerUseCase = registerUseCase,
       _loginUseCase = loginUseCase,
       super(AuthInitial());
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  Future<void> login(UserEntity user) async {
    emit(AuthLoading());
    final resulet = await _loginUseCase.invok(user);

    switch (resulet) {
      case Success<bool>():
        emit(AuthSuccess());
      case Error<bool>():
        emit(AuthError(resulet.error));
    }
  }

  Future<void> register(UserEntity user) async {
    emit(AuthLoading());
    final resulet = await _registerUseCase.invok(user);

    switch (resulet) {
      case Success<bool>():
        emit(AuthSuccess());
      case Error<bool>():
        emit(AuthError(resulet.error));
    }
  }
}
