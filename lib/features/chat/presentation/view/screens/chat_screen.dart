import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:chat_app/features/chat/domain/use_case/get_messages_use_cse.dart';
import 'package:chat_app/features/chat/domain/use_case/send_messages_use_case.dart';
import 'package:chat_app/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:chat_app/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:chat_app/features/search/domain/entity/search_user_entity.dart'; // الـ Entity بتاع الصديق
import 'package:firebase_auth/firebase_auth.dart'; // عشان نجيب الـ ID بتاعك
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const String route = "ChatScreen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatCubit? _cubit;
  late SearchUserEntity friendEntity;
  late String chatId;
  late String myUid;
  final TextEditingController _messageController = TextEditingController();
  bool _isInitialized = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    friendEntity =
        ModalRoute.of(context)!.settings.arguments as SearchUserEntity;

    myUid = FirebaseAuth.instance.currentUser?.uid ?? "";

    List<String> ids = [myUid, friendEntity.uid];
    ids.sort();
    chatId = ids.join("_");

    if (!_isInitialized) {
      _cubit = ChatCubit(
        getMessages: getMessagesUseCaseInjectable(),
        sendMessage: sendMessageUseCaseInjectable(),
      );

      _cubit?.getMessages(chatId);
      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    _cubit?.close();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          friendEntity.name,
          style: TextStyle(color: AppColors.textColor, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              bloc: _cubit,
              listener: (context, state) {
                if (state is SendMessageSuccess) {}
                if (state is ChatError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              buildWhen: (previous, current) =>
                  current is ChatLoading ||
                  current is ChatEmpty ||
                  current is GetMessagesSuccess,
              builder: (context, state) {
                if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ChatEmpty) {
                  return const Center(child: Text("ابدأ المحادثة الآن..."));
                }

                if (state is GetMessagesSuccess) {
                  final messages = state.messages;

                  return ListView.builder(
                    itemCount: messages.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      return ChatBubble(
                        message: msg.text,
                        isMe: msg.senderId == myUid,
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _messageController,
              onSubmitted: (value) => _sendMsg(),
              decoration: InputDecoration(
                hintText: "send your message",
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: AppColors.primaryColor),
                  onPressed: _sendMsg,
                ),
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
        ],
      ),
    );
  }

  void _sendMsg() {
    if (_messageController.text.trim().isEmpty) return;
    final String myName =
        FirebaseAuth.instance.currentUser?.displayName ?? "user";

    final newMessage = MessageEntity(
      text: _messageController.text.trim(),
      senderId: myUid,
      receiverId: friendEntity.uid,
      date: DateTime.now().toIso8601String(),
    );

    _cubit?.sendMessage(
      chatId,
      newMessage,
      [myUid, friendEntity.uid],
      myName,
      friendEntity.name,
    );

    _messageController.clear();
  }
}
