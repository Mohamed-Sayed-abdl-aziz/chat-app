import 'package:chat_app/view/widgets/custom_button.dart';
import 'package:chat_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SinupView extends StatelessWidget {
  const SinupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff26435F),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/scholar.png'),
              Text(
                "scholar Chat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 100),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sin in",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              CustomTextField(hintText: "Email"),
              CustomTextField(hintText: "passwared"),

              CustomButton(category: 'sin in'),
            ],
          ),
        ),
      ),
    );
  }
}
