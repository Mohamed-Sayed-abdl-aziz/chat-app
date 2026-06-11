import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/validator_app.dart';
import 'package:chat_app/core/widgets/app_dialog.dart';
import 'package:chat_app/features/auth/data/model/user_model.dart';
import 'package:chat_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_case/register_use_case.dart';
import 'package:chat_app/features/auth/presentation/view/screens/regiser_screen.dart';
import 'package:chat_app/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:chat_app/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:chat_app/features/auth/presentation/view_model/authcubit/authcubit_cubit.dart';
import 'package:chat_app/features/home/presentation/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String route = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();

  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  late final AuthCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = AuthCubit(
      loginUseCase: loginUseCaseinjectable(),
      registerUseCase: registerUseCaseinjectable(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state is AuthLoading) {
          AppDialog.showLoadingUi(context);
        }
        if (state is AuthError) {
          Navigator.of(context).pop();
          AppDialog.showErrorUi(context: context, error: state.error);
        }
        if (state is AuthSuccess) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(HomeScreen.route);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: email,
                    hintText: "Email",
                    validator: ValidatorApp.validateEmail,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: password,
                    hintText: "passwared",
                    validator: ValidatorApp.validatePassword,
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    category: 'Login',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        _cubit.login(
                          UserModel(
                            email: email.text,
                            passwared: password.text,
                          ),
                        );
                      }
                    },
                  ),
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
        ),
      ),
    );
  }
}
