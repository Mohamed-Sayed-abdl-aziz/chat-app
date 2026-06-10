import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/validator_app.dart';
import 'package:chat_app/features/auth/presentation/view/screens/regiser_screen.dart';
import 'package:chat_app/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:chat_app/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String route = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              Image.asset('assets/images/scholar.png'),
              Text(
                "Scholar Chat",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 100),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "login",
                  style: TextStyle(color: AppColors.textColor, fontSize: 35),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: "Email",
                validator: ValidatorApp.validateEmail,
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: "passwared",
                validator: ValidatorApp.validatePassword,
              ),
              SizedBox(height: 20),
              CustomButton(category: 'Login'),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account ",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.route);
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: AppColors.secundryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
