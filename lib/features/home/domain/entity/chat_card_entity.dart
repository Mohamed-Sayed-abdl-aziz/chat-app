class ChatCardEntity {
  ChatCardEntity({
    required this.lastMessage,
    required this.lastMessageDate,
    required this.friendName,
  });

  final String lastMessage;
  final String lastMessageDate;
  final String friendName;
}
