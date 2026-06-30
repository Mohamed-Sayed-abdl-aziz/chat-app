import 'dart:async';
import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/home/domain/entity/chat_card_entity.dart';
import 'package:chat_app/features/home/domain/use_case/get_all_friends_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required GetAllFriendsUseCase getAllChatsUseCase})
    : _getAllChatsUseCase = getAllChatsUseCase,
      super(HomeInitial());

  final GetAllFriendsUseCase _getAllChatsUseCase;
  StreamSubscription? _chatsSubscription;

  void getAllChats() {
    emit(HomeLoading());

    _chatsSubscription?.cancel();

    _chatsSubscription = _getAllChatsUseCase.invoke().listen((result) {
      switch (result) {
        case Success<List<ChatCardEntity>>():
          if (result.data.isEmpty) {
            emit(HomeChatsEmpty());
          } else {
            emit(HomeGetChatsSuccess(chats: result.data));
          }
        case Error<List<ChatCardEntity>>():
          emit(HomeError(error: result.error));
      }
    });
  }

  @override
  Future<void> close() {
    _chatsSubscription?.cancel();
    return super.close();
  }
}
