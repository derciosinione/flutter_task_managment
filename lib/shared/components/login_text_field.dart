import 'package:flutter/material.dart';

import '../../themes/app_text_style.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool? isPassWord;
  final IconData? prefixIcon;
  final Widget? sufixIcon;
  final TextInputType? textInputType;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function()? onEditingComplete;

  const AppTextField({
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: TextFormField(
        initialValue: initialValue,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          // contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
          contentPadding: const EdgeInsets.only(left: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          // errorStyle: ,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: hintText,
          label: Text(label),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: sufixIcon,
        ),
        style: AppTextStyles.titleRegular,
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: (isPassWord == true) ? true : false,
        autocorrect: (isPassWord == true) ? false : true,
        enableSuggestions: (isPassWord == true) ? false : true,
      ),
    );
  }
}
