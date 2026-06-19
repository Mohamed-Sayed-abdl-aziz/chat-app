class ChatEntity {
  ChatEntity({
    required this.chatId,
    required this.users,
    required this.message,
    required this.lastMessageDate,
  });
  final String chatId;
  final List<String> users;
  final String message;
  final String lastMessageDate;
}
