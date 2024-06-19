import 'package:flutter/material.dart';
import 'package:im_task_managment/themes/app_text_style.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../../shared/components/app_rounded_elevated_button.dart';
import '../../shared/components/app_text_form_field.dart';
import '../../shared/components/button/load_btn_text_widget.dart';
import '../../themes/app_colors.dart';
import '../../utils/app_config.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      backgroundColor: AppColors.body,
      appBar: AppBar(
        title: const Text("Editar Perfil"),
        backgroundColor: AppColors.body,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConfig.defaultPadding),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Container(
                      width: 128,
                      height: 128,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        ),
                      ),
                    ),
                    Text(
                      user!.name,
                      style:
                          AppTextStyles.titleMedium(AppColors.blackShape, 14),
                    ),
                    Text(
                      user.email,
                      style: AppTextStyles.secondaryTitle13,
                    ),
                  ],
                ),
              ),
              AppTextFormField(
                label: "Nome",
                initialValue: user.name,
              ),
              AppTextFormField(
                label: "Email",
                initialValue: user.email,
              ),
              AppTextFormField(
                label: "Telefone",
                initialValue: user.phoneNumber,
              ),
              const SizedBox(height: 10),
              AppRoundedElevatedButton(
                onPressed: () => {},
                displayWidget: loadBtnTextWidget("Salvar", false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
