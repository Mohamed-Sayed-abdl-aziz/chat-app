import 'package:chat_app/features/chat/domain/entity/message_entity.dart';

class MessageDto {
  MessageDto({
    required this.text,
    required this.senderId,
    required this.date,
    required this.receiverId,
  });
  final String text;
  final String senderId;
  final String receiverId;
  final String date;

  factory MessageDto.fromJson(jsonData) => MessageDto(
    text: jsonData["text"],
    senderId: jsonData["senderId"],
    date: jsonData["date"],
    receiverId: jsonData["receiverId"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "senderId": senderId,
    "receiverId": receiverId,
    "date": date,
  };

  MessageEntity toEntity() => MessageEntity(
    text: text,
    senderId: senderId,
    date: date,
    receiverId: receiverId,
  );
}
