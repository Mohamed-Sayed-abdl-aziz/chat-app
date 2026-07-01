class ChatEntity {
  ChatEntity({
    required this.chatId,
    required this.users,
    required this.message,
    required this.lastMessageDate,
    required this.senderName,
    required this.receiverName,
  });
  final String chatId;
  final List<String> users;
  final String message;
  final String lastMessageDate;
  final String senderName;
  final String receiverName;
}
