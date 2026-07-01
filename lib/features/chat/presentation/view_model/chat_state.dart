part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class GetMessagesSuccess extends ChatState {
  GetMessagesSuccess({required this.messages});
  final List<MessageEntity> messages;
}

class ChatLoading extends ChatState {}

class ChatError extends ChatState {
  ChatError({required this.error});
  final String error;
}

class SendMessageSuccess extends ChatState {}

class ChatEmpty extends ChatState {}
