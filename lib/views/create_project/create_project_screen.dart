import 'package:flutter/material.dart';
import 'package:im_task_managment/services/project_service.dart';
import 'package:im_task_managment/shared/components/app_text_form_field.dart';
import 'package:im_task_managment/utils/app_config.dart';
import 'package:im_task_managment/utils/utils.dart';
import 'package:im_task_managment/validations/project_validator.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../../shared/components/app_rounded_elevated_button.dart';
import '../../shared/components/button/load_btn_text_widget.dart';
import '../../shared/toast_message.dart';
import '../../themes/app_colors.dart';
import '../home/home_screen.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProjectScreen> {
  late bool isLoading = false;

  final service = ProjectService();
  final validator = ProjectValidator();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    isLoading = false;
    dueDateController.text = formatDateString(selectedDate.toString());
    super.initState();
  }

  void _checkIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final loggedUser = userProvider.user;

    return Scaffold(
      backgroundColor: AppColors.body,
      appBar: AppBar(
        title: const Text("Criar Projeto"),
        backgroundColor: AppColors.body,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConfig.defaultPadding),
          child: Form(
            key: validator.formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                AppTextFormField(
                  label: "Nome",
                  hintText: "Nome do projeto",
                  prefixIcon: Icons.description,
                  controller: nameController,
                ),
                AppTextFormField(
                  label: "Data de Entrega",
                  controller: dueDateController,
                  prefixIcon: Icons.date_range,
                  readOnly: true,
                  onPrefixTap: () async {
                    final DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(DateTime.now().year),
                      lastDate: DateTime(DateTime.now().year + 4),
                    );

                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                        dueDateController.text =
                            formatDateString(selectedDate.toString());
                      });
                    }
                  },
                ),
                AppTextFormField(
                  label: "Descricao",
                  minLines: 4,
                  controller: descriptionController,
                ),
                AppRoundedElevatedButton(
                  onPressed: () => _createProject(context, loggedUser!.id),
                  displayWidget: loadBtnTextWidget("Concluir", isLoading),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createProject(BuildContext context, String userId) async {
    if (isLoading) return;
    if (!validator.validateForm()) return;

    _checkIsLoading();

    var dueDate = DateTime.parse(dueDateController.text);

    var response = await service.createProject(
        userId: userId,
        name: nameController.text,
        description: descriptionController.text,
        dueDate: dueDate);

    if (!mounted) return;

    if (!response.success) {
      ToastMessage.showDismissed(
        context,
        "Erro ao criar o projecto",
        response.error!,
        AppColors.red,
        () {},
      );
    } else {
      ToastMessage.showDismissed(
        context,
        "Success",
        "Projecto criado com sucesso",
        AppColors.green,
        () {},
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }

    if (mounted) _checkIsLoading();
  }
}
