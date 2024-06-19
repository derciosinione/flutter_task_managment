import 'package:flutter/material.dart';
import 'package:im_task_managment/models/domain/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel? user) {
    _user = user;
    notifyListeners();
  }
}
