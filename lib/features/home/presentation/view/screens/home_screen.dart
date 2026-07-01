import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/features/chat/presentation/view/screens/chat_screen.dart';
import 'package:chat_app/features/home/domain/entity/chat_card_entity.dart';
import 'package:chat_app/features/home/domain/use_case/get_all_friends_use_case.dart';
import 'package:chat_app/features/home/presentation/view/widgets/empty_freinds_widget.dart'; // ويدجت الشاشة الفاضية
import 'package:chat_app/features/home/presentation/view/widgets/freind_container_widget.dart';
import 'package:chat_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:chat_app/features/search/domain/entity/search_user_entity.dart';
import 'package:chat_app/features/search/presentation/view/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(getAllChatsUseCase: getAllFriendsUseCaseInjectable())
            ..getAllChats(),
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.route);
              },
              icon: Icon(Icons.search, color: AppColors.secundryColor),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is HomeChatsEmpty) {
                    return const EmptyFreinds();
                  }

                  if (state is HomeGetChatsSuccess) {
                    final List<ChatCardEntity> activeChats = state.chats;

                    return ListView.builder(
                      itemCount: activeChats.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final chat = activeChats[index];

                        return FriendContainerWidget(
                          friendName: chat.friendName,
                          lastMessage: chat.lastMessage,
                          time: chat.lastMessageDate.split('T').first,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ChatScreen.route,
                              arguments: SearchUserEntity(
                                email: "",
                                phoneNumber: "",
                                uid: chat.friendId,
                                name: chat.friendName,
                              ),
                            );
                          },
                        );
                      },
                    );
                  }

                  if (state is HomeError) {
                    return Center(
                      child: Text(
                        state.error,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
