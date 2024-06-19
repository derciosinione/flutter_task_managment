import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:im_task_managment/models/domain/user_model.dart';
import 'package:im_task_managment/utils/app_config.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../../routes/app_routes.dart';
import '../../shared/components/app_password_field.dart';
import '../../shared/components/app_rounded_elevated_button.dart';
import '../../shared/components/button/load_btn_text_widget.dart';
import '../../shared/components/login_text_field.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_images.dart';
import '../../themes/app_text_style.dart';
import '../../validations/register_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final validator = UserValidator();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 20),
                  child: Text(
                    "Criar uma conta!",
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
                            label: "Nome Completo",
                            hintText: "Digite seu nome",
                            prefixIcon: Icons.person,
                            controller: fullNameController,
                            validator: validator.validateUsernameEmail,
                            textInputType: TextInputType.text,
                          ),
                          AppTextField(
                            label: "Username ou Email",
                            hintText: "Digite seu nome de usuário ou email",
                            prefixIcon: Icons.email,
                            controller: emailController,
                            validator: validator.validateUsernameEmail,
                            textInputType: TextInputType.emailAddress,
                          ),
                          AppTextField(
                            label: "Contacto",
                            hintText: "Digite seu contacto",
                            prefixIcon: Icons.phone,
                            controller: phoneNumberController,
                            validator: validator.validateUsernameEmail,
                            textInputType: TextInputType.text,
                          ),
                          AppPasswordField(
                              validator: validator.validatePassword,
                              controller: passwordController),
                          const SizedBox(height: 15),
                          AppRoundedElevatedButton(
                            onPressed: () => _register(context),
                            displayWidget:
                                loadBtnTextWidget("Criar conta", isLoading),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: TextButton(
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, AppRoutes.login),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Text.rich(TextSpan(
                                  text: "Já possui uma conta?",
                                  children: const [
                                    TextSpan(
                                      text: " Entrar",
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

  void _register(BuildContext context) async {
    if (isLoading) return;
    if (!validator.validateForm()) return;

    _checkIsLoading();

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final user = userCredential.user;

      await user?.updateDisplayName(fullNameController.text);

      UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          name: fullNameController.text,
          email: userCredential.user!.email ?? emailController.text,
          phoneNumber: phoneNumberController.text);

      // Save phone number to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());

      // Update the user state in Provider
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(userModel);

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.message}");
      String errorMessage = "An error occurred. Please try again later.";
      switch (e.code) {
        case 'weak-password':
          errorMessage = "The password provided is too weak.";
          break;
        case 'email-already-in-use':
          errorMessage = "The account already exists for that email.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is not valid.";
          break;
        default:
          errorMessage = "An error occurred. Please try again later.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: AppColors.primary,
        ),
      );
    } catch (e) {
      print("General Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("An unexpected error occurred. Please try again later."),
          backgroundColor: AppColors.primary,
        ),
      );
    } finally {
      if (mounted) {
        _checkIsLoading();
      }
    }
  }
}
