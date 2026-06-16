import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/search/domain/use_caes/search_use_case.dart';
import 'package:meta/meta.dart';
import 'package:chat_app/features/search/domain/entity/search_user_entity.dart';

part 'searchcubit_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required SearchUseCase useCase})
    : _useCase = useCase,
      super(SearchInitialState());

  final SearchUseCase _useCase;

  StreamSubscription? _searchSubscription;

  void searchByName(String query) {
    emit(SearchLoadinState());

    _searchSubscription?.cancel();

    _searchSubscription = _useCase.invoke(query).listen((result) {
      switch (result) {
        case Success<List<SearchUserEntity>>():
          final users = result.data;
          if (users.isEmpty) {
            emit(SearchEmptyState());
          } else {
            emit(SearchSuccessState(users, query));
          }
        case Error<List<SearchUserEntity>>():
          emit(SearchErrorState(result.error));
      }
    });
  }

  @override
  Future<void> close() {
    _searchSubscription?.cancel();
    return super.close();
  }
}
