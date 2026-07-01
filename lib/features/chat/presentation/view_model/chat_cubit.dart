import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:chat_app/features/chat/domain/use_case/get_messages_use_cse.dart';
import 'package:chat_app/features/chat/domain/use_case/send_messages_use_case.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({
    required GetMessagesUseCase getMessages,
    required SendMessageUseCase sendMessage,
  }) : _getMessages = getMessages,
       _sendMessage = sendMessage,
       super(ChatInitial());
  final GetMessagesUseCase _getMessages;
  final SendMessageUseCase _sendMessage;
  StreamSubscription? _getMessagesSubscription;
  void getMessages(String chatId) {
    emit(ChatLoading());
    _getMessagesSubscription?.cancel();
    _getMessagesSubscription = _getMessages.invoke(chatId).listen((resulte) {
      switch (resulte) {
        case Success<List<MessageEntity>>():
          if (resulte.data.isEmpty) {
            emit(ChatEmpty());
          } else {
            emit(GetMessagesSuccess(messages: resulte.data));
          }
        case Error<List<MessageEntity>>():
          emit(ChatError(error: resulte.error));
      }
    });
  }

  Future<void> sendMessage(
    String chatId,
    MessageEntity message,
    List<String> chatMembers,
    String senderName,
    String receiverName,
  ) async {
    final resulte = await _sendMessage.invoke(
      chatId,
      message,
      chatMembers,
      senderName,
      receiverName,
    );
    switch (resulte) {
      case Success<bool>():
        emit(SendMessageSuccess());
      case Error<bool>():
        emit(ChatError(error: resulte.error));
    }
  }

  @override
  Future<void> close() {
    _getMessagesSubscription?.cancel();
    return super.close();
  }
}
