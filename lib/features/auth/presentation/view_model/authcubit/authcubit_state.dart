part of 'authcubit_cubit.dart';

@immutable
abstract class AuthcubitState {}

class AuthcubitInitial extends AuthcubitState {}

class AuthLoading extends AuthcubitState {}

class AuthError extends AuthcubitState {
  final String error;
  AuthError(this.error);
}

class LoginSuccess extends AuthcubitState {}

class RegisterSuccess extends AuthcubitState {}
