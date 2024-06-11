import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_routes.dart';

abstract class CallScreen {
  // static const keyName = "getStartedCalled";
  static const keyName = "splash";

  static Future<void> nextScreen(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(keyName)) {
      await prefs.setBool(keyName, false);
    }

    bool checked = prefs.getBool(keyName)!;

    await Future.delayed(const Duration(seconds: 1));

    if (!checked) {
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.getStarted);
      return;
    }

    if (!context.mounted) return;
    await getSectionByToken(context);
  }

  static Future<void> getSectionByToken(BuildContext context) async {
    // bool isExpired = await isExpiredToken();

    bool isExpired = true;

    if (isExpired) {
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  static Future<bool> checkGetStartedPage() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(keyName, true);
  }

  static void nextScreenAndRemovePrevious(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }
}

void onButtonTapped(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 1));

  if (!context.mounted) return;
  Navigator.of(context).pop();
}
