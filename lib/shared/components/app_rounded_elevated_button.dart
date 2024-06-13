import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class AppRoundedElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? borderRadius;
  final Widget displayWidget;

  const AppRoundedElevatedButton({
    super.key,
    this.onPressed,
    required this.displayWidget,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
          ),
        ),
        child: displayWidget,
      ),
    );
  }
}
