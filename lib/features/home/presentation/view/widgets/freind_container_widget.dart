import 'package:flutter/material.dart';

class FriendContainerWidget extends StatelessWidget {
  final String friendName;
  final String lastMessage;
  final String time;
  final VoidCallback onTap;

  const FriendContainerWidget({
    super.key,
    required this.friendName,
    required this.lastMessage,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.blue[100],
            child: Text(
              friendName.isNotEmpty ? friendName[0].toUpperCase() : '?',
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          title: Text(
            friendName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              lastMessage,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Text(
            time,
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
        ),
      ),
    );
  }
}
