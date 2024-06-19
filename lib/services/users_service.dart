import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:im_task_managment/models/domain/user_model.dart';

import 'generic_response.dart';

class UsersService {
  Future<GenericResponse<UserModel>> getUserData() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        String uid = firebaseUser.uid;

        DocumentSnapshot documentSnapshot =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();

        if (documentSnapshot.exists) {
          var document = documentSnapshot.data() as Map<String, dynamic>;
          UserModel userModel = UserModel.fromJson(document);

          return GenericResponse.success(userModel);
        } else {
          return GenericResponse.failure("User document does not exist", 404);
        }
      } else {
        return GenericResponse.failure("No user is currently signed in", 401);
      }
    } catch (e) {
      return GenericResponse.failure('Error: $e', 500);
    }
  }
}
