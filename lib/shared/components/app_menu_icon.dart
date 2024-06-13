import 'package:flutter/material.dart';
import 'package:wb/shared/themes/app_colors.dart';
import 'package:wb/shared/themes/app_text_style.dart';

class MenuIcon extends StatelessWidget {
  final String displayText;
  final IconData icon;
  final bool? isActive;
  final VoidCallback? onTap;

  const MenuIcon(
      {Key? key,
      this.onTap,
      required this.displayText,
      required this.icon,
      this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: AppColors.primary,
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: SizedBox(
        width: 70,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,
                color:
                    (isActive == true) ? AppColors.primary : AppColors.input),
            Text(
              displayText,
              style: (isActive == true)
                  ? AppTextStyles.primaryIconTitle
                  : AppTextStyles.iconTitle,
            )
          ],
        ),
      ),
    );
  }
}
