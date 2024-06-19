import 'package:flutter/material.dart';
import 'package:im_task_managment/utils/app_config.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth_controller.dart';
import '../../providers/user_provider.dart';
import '../../routes/app_routes.dart';
import '../../shared/components/app_password_field.dart';
import '../../shared/components/app_rounded_elevated_button.dart';
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
  final validator = UserValidator();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkIsLoading() {
    if (!mounted) return;
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 20),
                  child: Text(
                    "Bem-vindo a bordo!",
                    style: AppTextStyles.titleHome,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppConfig.defaultPadding),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Form(
                      key: validator.formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            label: "Email",
                            hintText: "Digite seu email",
                            prefixIcon: Icons.person,
                            controller: userNameController,
                            validator: validator.validateUsernameEmail,
                            textInputType: TextInputType.emailAddress,
                          ),
                          AppPasswordField(
                            validator: validator.validatePassword,
                            controller: passwordController,
                          ),
                          const SizedBox(height: 10),
                          AppRoundedElevatedButton(
                            onPressed: () => _login(context),
                            displayWidget:
                                loadBtnTextWidget("Entrar", isLoading),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: TextButton(
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, AppRoutes.signIn),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Text.rich(TextSpan(
                                  text: "Não possui uma conta?",
                                  children: const [
                                    TextSpan(
                                      text: " Registar-se",
                                      style:
                                          TextStyle(color: AppColors.primary),
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _login(BuildContext context) async {
    if (isLoading) return;
    if (!validator.validateForm()) return;
    _checkIsLoading();

    await AuthController.login(
            context, userNameController.text, passwordController.text)
        .then((value) {
      if (value == null) return;

      // Update the user state in Provider
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(value);

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }).whenComplete(() {
      if (mounted) _checkIsLoading();
    });
  }
}
