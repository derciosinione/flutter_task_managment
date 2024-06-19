import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;

import '../../models/utils/register_user.dart';

class UserValidator {
  final formKey = GlobalKey<FormState>();
  RegisterUser model = RegisterUser();
  String _password = '';

  String? validateUsername(String? value) {
    if (value?.isEmpty ?? true) {
      return "O nome não pode ser vazio";
    } else if (!validator.isAlphanumeric(value!)) {
      return "O nome de usuário não pode conter simbolos nem espaços";
    }

    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "O nome não pode estar vazio";
    }

    return null;
  }

  String? validateEmail(String? value) =>
      !validator.isEmail(value!) ? "Insira um email válido!" : null;

  String? validateUsernameEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return "Este campo não pode ser nulo";
    }

    return null;
  }

  String? validatePassword(String? value) {
    _password = value!;

    if (value.isEmpty) {
      return "Insira uma senha";
    } else if (value.length != 6) {
      return "A senha só pode conter 6 digitos";
    } else if (!validator.isNumeric(value)) {
      return "A senha só pode conter digitos";
    }

    return null;
  }

  String? validateRepassword(String? value) =>
      value != _password ? "As senhas inseridas nao são compatíveis." : null;

  void onChange({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? rePassword,
  }) {
    model = model.copyWith(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      confirmPassword: rePassword,
    );
  }

  bool validateForm() => formKey.currentState!.validate();
}
