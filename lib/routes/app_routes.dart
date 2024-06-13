import 'package:flutter/material.dart';
import 'package:im_task_managment/views/home/home_screen.dart';

import '../views/get_started/get_started_screen.dart';
import '../views/login/login_screen.dart';
import '../views/splash/splash_screen.dart';

class AppRoutes {
  static const home = "/home";
  static const splash = "/splash";
  static const getStarted = "/getStarted";
  static const login = "/login";
  static const register = "/register";
  static const menu = "/menu";

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    return {
      splash: (context) => const SplashPage(),
      getStarted: (context) => const GetStartedPage(),
      login: (context) => const LoginPage(),
      register: (context) => const GetStartedPage(),
      home: (context) => const HomeScreen(),
    };
  }
}
