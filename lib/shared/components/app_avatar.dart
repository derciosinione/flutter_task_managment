import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class AppAvatar extends StatelessWidget {
  final String avatar;
  const AppAvatar({super.key, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(
          color: AppColors.primaryShape,
          width: 1,
        ),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Image.asset(
          avatar,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
