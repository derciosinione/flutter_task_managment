import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../shared/components/top_header.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_images.dart';
import '../../utils/call_next_screen_utils.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    void callLoginPage() {
      CallScreen.checkGetStartedPage().then((result) {
        if (result) {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      });
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          children: [
            TopHeader(
                image: Image.asset(
              AppImages.getstartedImage,
              width: 288,
              height: 227,
            )),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Text.rich(TextSpan(
                text: "Task ",
                children: [
                  TextSpan(
                    text: "Managment",
                    style: TextStyle(color: AppColors.primary),
                  )
                ],
                // style: AppTextStyles.titleHome,
              )),
            ),
            const Text(
              "Inicia uma nova jornada em \n gerenciamento de tarefas",
              // style: AppTextStyles.titleRegular,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: GestureDetector(
                onTap: callLoginPage,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_right_alt,
                        color: AppColors.background),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
