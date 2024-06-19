import 'package:flutter/material.dart';

class ProjectValidator {
  final formKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "O nome não pode estar vazio";
    }

    return null;
  }

  bool validateForm() => formKey.currentState!.validate();
}
