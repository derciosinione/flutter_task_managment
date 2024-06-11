import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

    return const Scaffold(
      backgroundColor: AppColors.background,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [Text("Login Form")],
          ),
        ),
      ),
    );
  }
}
