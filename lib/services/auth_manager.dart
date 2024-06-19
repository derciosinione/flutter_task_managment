import 'package:firebase_auth/firebase_auth.dart';
import 'package:im_task_managment/services/users_service.dart';
import 'package:im_task_managment/services/utils/storage_service.dart';

import 'exception/app_http_exception.dart';

class AuthManager {
  Future<dynamic> login(String username, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      UsersService service = UsersService();
      var response = await service.getUserData();

      if (!response.success) {
        ExceptionValidation.throwHttpError(401, response.error!);
      }

      AppStorage.save("id", response.data!.id);
      return response.data;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          ExceptionValidation.throwHttpError(
              401, 'The email address is not valid.');
          break;
        case 'invalid-credential':
          ExceptionValidation.throwHttpError(
              401, 'The provided data is invalid.');
          break;
        case 'user-disabled':
          ExceptionValidation.throwHttpError(
              401, 'The user account has been disabled.');
          break;
        case 'user-not-found':
          ExceptionValidation.throwHttpError(
              401, 'No user found with this email.');
          break;
        case 'wrong-password':
          ExceptionValidation.throwHttpError(401, 'Incorrect password.');
          break;
        default:
          ExceptionValidation.throwHttpError(
              401, 'An unexpected error occurred. Please try again later.');
      }
    } catch (e) {
      ExceptionValidation.throwHttpError(
          500, 'An unexpected error occurred. Please try again later.');
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    AppStorage.save("id", "");
  }
}
