import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_style.dart';

class ToastMessage {
  static show(BuildContext context, String msg, Color backgroundColor) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      backgroundColor: backgroundColor,
      content: Text(msg),
      dismissDirection: DismissDirection.horizontal,
      // elevation: 1,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ));
  }

  static showDismissed(BuildContext context, String title, String msg,
      Color backgroundColor, Function onPressed) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      content: Text.rich(
        TextSpan(
          text: "$title \n",
          style: AppTextStyles.titleNormal(AppColors.white, 12.5),
          children: [
            TextSpan(
              text: msg,
              style: AppTextStyles.titleMedium(AppColors.background, 12),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 10),
      dismissDirection: DismissDirection.horizontal,
      action: SnackBarAction(
          label: "Fechar",
          textColor: Colors.white,
          disabledTextColor: Colors.green,
          onPressed: () => onPressed),
      // elevation: 1,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ));
  }
}
