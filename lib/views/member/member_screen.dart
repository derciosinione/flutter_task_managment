import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_images.dart';
import '../../utils/app_config.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.body,
      appBar: AppBar(
        title: const Text("Equipa"),
        backgroundColor: AppColors.body,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConfig.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo),
              const SizedBox(height: 20),
              const Text("Funcionalidade em desenvolvimento")
            ],
          ),
        ),
      ),
    );
  }
}
