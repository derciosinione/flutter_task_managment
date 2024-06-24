import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool? isPassWord;
  final bool readOnly;
  final int minLines;
  final IconData? prefixIcon;
  final Widget? sufixIcon;
  final TextInputType? textInputType;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onPrefixTap;

  const AppTextFormField(
      {super.key,
      required this.label,
      this.hintText,
      this.isPassWord,
      this.prefixIcon,
      this.sufixIcon,
      this.textInputType,
      this.initialValue,
      this.validator,
      this.controller,
      this.onChanged,
      this.onEditingComplete,
      this.onPrefixTap,
      this.minLines = 1,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        initialValue: initialValue,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onChanged: onChanged,
        readOnly: readOnly,
        onEditingComplete: onEditingComplete,
        maxLines: null,
        minLines: minLines,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18),
          // contentPadding: const EdgeInsets.only(left: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          // errorStyle: ,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: hintText,
          hintStyle: AppTextStyles.titleNormal(AppColors.input, 13),
          label: Text(label),
          labelStyle: AppTextStyles.titleNormal(AppColors.input, 14),
          prefixIcon: prefixIcon != null
              ? GestureDetector(
                  onTap: onPrefixTap,
                  child: Icon(prefixIcon),
                )
              : null,
          suffixIcon: sufixIcon,
        ),
        style: AppTextStyles.titleNormal(AppColors.blackShape, 15),
        keyboardType: TextInputType.text,
        enableSuggestions: true,
      ),
    );
  }
}
