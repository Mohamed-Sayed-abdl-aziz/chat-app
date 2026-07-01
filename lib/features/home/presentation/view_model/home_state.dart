part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeGetChatsSuccess extends HomeState {
  final List<ChatCardEntity> chats;
  HomeGetChatsSuccess({required this.chats});
}

class HomeChatsEmpty extends HomeState {}

class HomeError extends HomeState {
  final String error;
  HomeError({required this.error});
}
