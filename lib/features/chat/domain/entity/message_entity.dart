class MessageEntity {
  MessageEntity({
    required this.text,
    required this.senderId,
    required this.date,
    required this.receiverId,
  });
  final String text;
  final String senderId;
  final String receiverId;
  final String date;
}
