import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(14),
      ),
      width: double.infinity,
      height: 48,
      alignment: Alignment.center,
      child: Text(
        category,
        style: TextStyle(
          color: Color(0xff26435F),
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
