import 'package:chat_app/features/chat/presentation/view/screens/chat_screen.dart';
import 'package:chat_app/features/home/presentation/view/screens/home_screen.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/features/auth/presentation/view/screens/login_screen.dart';
import 'package:chat_app/features/auth/presentation/view/screens/regiser_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterScreen.route: (context) => RegisterScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        ChatScreen.route: (context) => ChatScreen(),
        HomeScreen.route: (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.route,
    );
  }
}
