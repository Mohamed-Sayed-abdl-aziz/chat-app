import 'package:flutter/material.dart';

class EmptyFreinds extends StatelessWidget {
  const EmptyFreinds({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No chats founded",
        style: TextStyle(
          color: Color(0xff000000),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
