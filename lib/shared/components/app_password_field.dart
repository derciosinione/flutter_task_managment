import 'package:flutter/material.dart';

import 'login_text_field.dart';

class AppPasswordField extends StatefulWidget {
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;

  const AppPasswordField({
    super.key,
    this.initialValue,
    this.validator,
    this.controller,
    this.onChanged,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  late bool isPassword = true;

  void changeState() {
    setState(() {
      isPassword = !isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: "Senha",
      hintText: "Insira a senha",
      isPassWord: isPassword,
      textInputType: TextInputType.number,
      prefixIcon: Icons.password,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onChanged: widget.onChanged,
      controller: widget.controller,
      sufixIcon: IconButton(
          onPressed: () => changeState(),
          icon: const Icon(
            Icons.remove_red_eye,
          )),
    );
  }
}
