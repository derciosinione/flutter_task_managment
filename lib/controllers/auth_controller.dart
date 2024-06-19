import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/auth_manager.dart';
import '../services/exception/app_http_exception.dart';
import '../shared/timeout_tost_message.dart';
import '../shared/toast_message.dart';

class AuthController {
  static Future<dynamic> login(
      BuildContext context, String username, String password) async {
    var authApi = AuthManager();

    return await authApi.login(username, password).catchError((error) {
      Map<String, dynamic> jsonError = jsonDecode(error.message);
      ToastMessage.showDismissed(
        context,
        jsonError['title'],
        jsonError['error'],
        Colors.red,
        () {},
      );
    }, test: (error) => error is AppHttpException).catchError((e) {
      timeOutTostMessage(context);
    }, test: (e) => e is TimeoutException);
  }

  static logout(BuildContext context) async {
    var authApi = AuthManager();
    await authApi.logout().catchError((error) {
      Map<String, dynamic> jsonError = jsonDecode(error.message);

      ToastMessage.showDismissed(
          context, jsonError['title'], jsonError['error'], Colors.red, () {});
    }, test: (error) => error is AppHttpException).catchError((e) {
      timeOutTostMessage(context);
    }, test: (e) => e is TimeoutException);
  }
}
