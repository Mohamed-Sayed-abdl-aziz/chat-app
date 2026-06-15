import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/features/home/presentation/view/widgets/freind_container_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/scholar.png", width: 50, height: 50),
            Text(
              "Chat",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "search on your friends",
                suffixIcon: Icon(Icons.send, color: AppColors.primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
          FriendContainerWidget(
            friendName: "mohamed Romdan",
            lastMessage: "يا صاحبي خلصت الكود ولا لسه؟",
            time: "10:30 PM",
            onTap: () {},
          ),
          // EmptyFreinds(),
        ],
      ),
    );
  }
}



          // Expanded(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) {
          //       return;
          //     },
          //   ),
          // ),
