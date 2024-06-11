import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../shared/components/app_password_field.dart';
import '../../shared/components/button/app_rounded_elevated_button.dart';
import '../../shared/components/button/load_btn_text_widget.dart';
import '../../shared/components/login_text_field.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_images.dart';
import '../../themes/app_text_style.dart';
import '../../validations/user/register_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final api = AuthManager();
  final validator = UserValidator();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  late bool isLoading = false;

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  void _checkIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: size.width * 0.40),
            child: Image.asset(AppImages.headerCircles),
          ),
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 20),
                  child: Text(
                    "Bem-vindo a bordo!",
                    style: AppTextStyles.titleHome,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Form(
                    key: validator.formKey,
                    child: Column(
                      children: [
                        AppTextField(
                          label: "Username ou Email",
                          hintText: "Digite seu nome de usuário ou email",
                          prefixIcon: Icons.person,
                          controller: userNameController,
                          validator: validator.validateUsernameEmail,
                          textInputType: TextInputType.emailAddress,
                        ),
                        AppPasswordField(
                          validator: validator.validatePassword,
                          controller: passwordController,
                          // onChanged: (value) =>
                          //     validator.onChange(password: value),
                        ),
                        AppRoundedElevatedButton(
                          // onPressed: () => _login(context),
                          displayWidget: loadBtnTextWidget("Entrar", isLoading),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: TextButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, AppRoutes.register),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Text.rich(TextSpan(
                                text: "Não possui uma conta?",
                                children: const [
                                  TextSpan(
                                    text: " Registar-se",
                                    style: TextStyle(color: AppColors.primary),
                                  )
                                ],
                                style: AppTextStyles.titleRegular13,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
