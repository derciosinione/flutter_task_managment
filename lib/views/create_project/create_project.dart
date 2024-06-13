import 'package:flutter/material.dart';
import 'package:im_task_managment/shared/components/app_text_form_field.dart';
import 'package:im_task_managment/utils/app_config.dart';
import 'package:im_task_managment/views/home/home_screen.dart';

import '../../shared/components/app_rounded_elevated_button.dart';
import '../../shared/components/button/load_btn_text_widget.dart';
import '../../themes/app_colors.dart';
import '../../utils/call_next_screen_utils.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
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

  void _makeBet(
      BuildContext context, String userAccountId, String betTypeId) async {
    if (isLoading) return;
    // if (!validator.validateForm()) return;
    _checkIsLoading();

    // int guessBetNumber = int.parse(guessBetResultController.text);

    // await BetController.makeBet(
    //     context, userAccountId, betTypeId, guessBetNumber)
    //     .whenComplete(_checkIsLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.body,
      appBar: AppBar(
        title: const Text("Criar Projeto"),
        backgroundColor: AppColors.body,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConfig.defaultPadding),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const AppTextFormField(
                label: "Nome",
                hintText: "Nome do projeto",
              ),
              const AppTextFormField(
                label: "Descricao",
                maxLines: 3,
              ),
              AppRoundedElevatedButton(
                onPressed: () => {
                  CallScreen.nextScreenAndRemovePrevious(
                    context,
                    const HomeScreen(),
                  )
                },
                displayWidget: loadBtnTextWidget("Concluir", isLoading),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
