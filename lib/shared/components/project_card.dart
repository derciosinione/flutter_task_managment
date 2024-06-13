import 'package:flutter/material.dart';
import 'package:im_task_managment/themes/app_colors.dart';

import '../../themes/app_text_style.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Projeto Learn+",
                        style: AppTextStyles.titleSemiBold(
                            AppColors.blackShape, 15),
                      ),
                      Text(
                        "2 dias atras",
                        style: AppTextStyles.iconTitle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "70 - 90",
                        style: AppTextStyles.titleNormal(AppColors.grey, 11),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Done",
                            style: AppTextStyles.titleSemiBold(
                                AppColors.white, 11)),
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
    );
  }
}
