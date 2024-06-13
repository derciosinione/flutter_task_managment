import 'package:flutter/material.dart';
import 'package:im_task_managment/themes/app_images.dart';

import '../../themes/app_colors.dart';
import '../../utils/app_config.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.body,
      appBar: AppBar(
        title: const Text("Notificações"),
        backgroundColor: AppColors.body,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConfig.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo),
              SizedBox(height: 20),
              Text("Funcionalidade em desenvolvimento")
            ],
          ),
        ),
      ),
    );
  }
}
