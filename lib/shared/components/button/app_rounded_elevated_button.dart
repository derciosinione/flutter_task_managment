import 'package:flutter/material.dart';

import '../../../utils/app_config.dart';

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
    return Container(
      margin: const EdgeInsets.only(
        right: AppConfig.defaultPadding,
        left: AppConfig.defaultPadding,
      ),
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ))),
        child: displayWidget,
      ),
    );
  }
}
