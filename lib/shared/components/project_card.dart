import 'package:flutter/material.dart';
import 'package:im_task_managment/models/domain/projects_status.dart';
import 'package:im_task_managment/themes/app_colors.dart';
import 'package:im_task_managment/views/create_project/edit_project_screen.dart';

import '../../models/domain/project_model.dart';
import '../../routes/app_routes.dart';
import '../../services/project_service.dart';
import '../../themes/app_text_style.dart';
import '../../utils/utils.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final Function() onDismissed;

  const ProjectCard(
      {super.key, required this.project, required this.onDismissed});

  @override
  Widget build(BuildContext context) {
    String projectName = project.name.length > 18
        ? '${project.name.substring(0, 18)}...'
        : project.name;

    final service = ProjectService();

    return Dismissible(
      key: Key(project.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content:
                  Text("Tem certeza de que deseja excluir ${project.name}?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("CANCELAR"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text("ELIMINAR"),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        onDismissed();
      },
      child: GestureDetector(
        onTap: () {
          service.deleteProject(id: project.id);
          print("$projectName selecionado");
          Navigator.pushNamed(
            context,
            AppRoutes.editProject,
            arguments: EditProjectScreenArguments(project: project),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 90,
          child: Row(
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: SizedBox(
                  width: 66,
                  height: 90,
                  child: Image(
                    image: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1674675646732-ba4fa66122b1?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            projectName,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.titleSemiBold(
                                AppColors.blackShape, 15),
                          ),
                          Text(
                            formatDateTimeToAgo(project.dueDate),
                            style: AppTextStyles.iconTitle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "70 - 90",
                            style:
                                AppTextStyles.titleNormal(AppColors.grey, 11),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: project.status == ProjectStatus.completed
                                  ? AppColors.green
                                  : AppColors.primaryOpacity,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(project.status,
                                style: project.status == ProjectStatus.completed
                                    ? AppTextStyles.titleSemiBold(
                                        AppColors.white, 11)
                                    : AppTextStyles.titleSemiBold(
                                        AppColors.heading, 11)),
                          ),
                        ],
                      ),
                      const LinearProgressIndicator(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        value: 0.8,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
