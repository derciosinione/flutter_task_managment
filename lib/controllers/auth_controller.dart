import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wb/services/http/api/auth_manager.dart';
import 'package:wb/services/http/exceptions/app_http_exception.dart';
import 'package:wb/shared/components/timeout_tost_message.dart';
import 'package:wb/shared/components/toast_message.dart';

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
