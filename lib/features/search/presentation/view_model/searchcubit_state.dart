part of 'searchcubit_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadinState extends SearchState {}

class SearchEmptyState extends SearchState {}

class SearchSuccessState extends SearchState {
  SearchSuccessState(this.users, this.query);
  final List<SearchUserEntity> users;
  final String query;
}

class SearchErrorState extends SearchState {
  SearchErrorState(this.error);
  final String error;
}
