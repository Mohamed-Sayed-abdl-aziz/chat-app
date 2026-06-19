import 'package:chat_app/features/chat/domain/entity/chat_entity.dart';

class ChatDto {
  ChatDto({
    required this.chatId,
    required this.users,
    required this.message,
    required this.lastMessageDate,
  });
  final String chatId;
  final List<String> users;
  final String message;
  final String lastMessageDate;

  factory ChatDto.fromJson(jsonData) => ChatDto(
    chatId: jsonData["chatId"],
    users: jsonData["users"],
    message: jsonData["message"],
    lastMessageDate: jsonData["lastMessageDate"],
  );

  Map<String, dynamic> toJson() => {
    "chatId": chatId,
    "users": users,
    "message": message,
    "lastMessageDate": lastMessageDate,
  };

  ChatEntity toEntity() => ChatEntity(
    chatId: chatId,
    users: users,
    message: message,
    lastMessageDate: lastMessageDate,
  );
}
