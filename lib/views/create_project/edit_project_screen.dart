import 'package:flutter/material.dart';
import 'package:im_task_managment/models/domain/project_model.dart';
import 'package:im_task_managment/models/domain/projects_status.dart';
import 'package:im_task_managment/services/project_service.dart';
import 'package:im_task_managment/shared/components/app_text_form_field.dart';
import 'package:im_task_managment/utils/app_config.dart';
import 'package:im_task_managment/validations/project_validator.dart';

import '../../shared/components/app_rounded_elevated_button.dart';
import '../../shared/components/button/load_btn_text_widget.dart';
import '../../shared/toast_message.dart';
import '../../themes/app_colors.dart';
import '../../utils/utils.dart';
import '../home/home_screen.dart';

class EditProjectScreenArguments {
  final ProjectModel project;
  EditProjectScreenArguments({required this.project});
}

class EditProjectScreen extends StatefulWidget {
  const EditProjectScreen({super.key});

  @override
  State<EditProjectScreen> createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProjectScreen> {
  late bool isLoading = false;

  final service = ProjectService();
  final validator = ProjectValidator();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isDateChanged = false;
  final dueDateController = TextEditingController();

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments
        as EditProjectScreenArguments;
    nameController.text = args.project.name;
    descriptionController.text = args.project.description;

    if (!isDateChanged) {
      dueDateController.text =
          formatDateString(args.project.dueDate.toString());
    } else {
      dueDateController.text = formatDateString(selectedDate.toString());
    }
  }

  void _checkIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as EditProjectScreenArguments;

    return Scaffold(
      backgroundColor: AppColors.body,
      appBar: AppBar(
        title: const Text("Editar Projecto"),
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
                        isDateChanged = true;
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
                  onPressed: () => _updateProject(context, args.project.id),
                  displayWidget: loadBtnTextWidget("Concluir", isLoading),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateProject(BuildContext context, String projectId) async {
    if (isLoading) return;
    if (!validator.validateForm()) return;

    _checkIsLoading();

    var dueDate = DateTime.parse(dueDateController.text);

    var response = await service.updateProject(
      id: projectId,
      name: nameController.text,
      status: ProjectStatus.inProgress,
      description: descriptionController.text,
      dueDate: dueDate,
    );

    if (!mounted) return;

    if (!response.success) {
      ToastMessage.showDismissed(
        context,
        "Erro ao atualizar o projecto",
        response.error!,
        AppColors.red,
        () {},
      );
    } else {
      ToastMessage.showDismissed(
        context,
        "Success",
        "Projecto atualizado com sucesso",
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
