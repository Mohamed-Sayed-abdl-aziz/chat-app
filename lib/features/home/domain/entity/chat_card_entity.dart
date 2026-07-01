class ChatCardEntity {
  ChatCardEntity({
    required this.lastMessage,
    required this.lastMessageDate,
    required this.friendName,
    required this.friendId,
  });

  final String lastMessage;
  final String lastMessageDate;
  final String friendName;
  final String friendId;
}
