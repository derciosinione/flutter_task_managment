import 'package:flutter/material.dart';
import 'package:im_task_managment/views/dashboard/dashboard_screen.dart';
import 'package:im_task_managment/views/home/home_screen.dart';
import 'package:im_task_managment/views/member/member_screen.dart';
import 'package:im_task_managment/views/notifications/notification_screen.dart';

import '../views/create_project/create_project.dart';
import '../views/get_started/get_started_screen.dart';
import '../views/login/login_screen.dart';
import '../views/profile/edit_profile_screen.dart';
import '../views/project/project_screen.dart';
import '../views/splash/splash_screen.dart';

class AppRoutes {
  static const home = "/home";
  static const splash = "/splash";
  static const getStarted = "/getStarted";
  static const login = "/login";
  static const register = "/register";
  static const createProject = "/create-project";
  static const menu = "/menu";
  static const editProfile = "/menu";
  static const notifications = "/notifications";
  static const members = "/members";
  static const projects = "/projects";
  static const dashboard = "/dashboard";

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    return {
      splash: (context) => const SplashPage(),
      getStarted: (context) => const GetStartedPage(),
      login: (context) => const LoginPage(),
      register: (context) => const GetStartedPage(),
      home: (context) => const HomeScreen(),
      createProject: (context) => const CreateProject(),
      editProfile: (context) => const EditProfileScreen(),
      projects: (context) => const ProjectScreen(),
      notifications: (context) => const NotificationScreen(),
      dashboard: (context) => const DashboardScreen(),
      members: (context) => const MemberScreen(),
    };
  }
}
