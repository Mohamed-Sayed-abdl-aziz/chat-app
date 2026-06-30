import 'package:chat_app/features/chat/domain/entity/chat_entity.dart';

class ChatDto {
  ChatDto({
    this.chatId,
    this.users,
    this.message,
    this.lastMessageDate,
    this.senderName,
    this.receiverName,
  });
  final String? chatId;
  final List<String>? users;
  final String? message;
  final String? lastMessageDate;
  final String? senderName;
  final String? receiverName;

  factory ChatDto.fromJson(jsonData) => ChatDto(
    chatId: jsonData["chatId"] ?? "",
    users: jsonData["users"] ?? [],
    message: jsonData["message"] ?? "",
    lastMessageDate: jsonData["lastMessageDate"] ?? "",
    senderName: jsonData["senderName"] ?? "",
    receiverName: jsonData["receiverName"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "chatId": chatId,
    "users": users,
    "message": message,
    "lastMessageDate": lastMessageDate,
    "senderName": senderName,
    "receiverName": receiverName,
  };

  ChatEntity toEntity() => ChatEntity(
    chatId: chatId ?? "",
    users: users ?? [],
    message: message ?? "",
    lastMessageDate: lastMessageDate ?? "",
    senderName: senderName ?? "",
    receiverName: receiverName ?? "",
  );
}
