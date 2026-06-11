import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.secundryColor);
  }
}
