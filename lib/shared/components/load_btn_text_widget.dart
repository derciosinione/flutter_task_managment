import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_style.dart';

Widget loadBtnTextWidget(String title, bool isLoading) {
  return !isLoading
      ? Text(
          title,
          style: AppTextStyles.titleRegularWithe,
        )
      : const SizedBox(
          width: 28,
          height: 28,
          child: CircularProgressIndicator(
            color: AppColors.background,
            strokeWidth: 2,
          ),
        );
}
