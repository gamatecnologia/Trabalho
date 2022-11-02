import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/register_user_model.dart';

class UsersDataSource {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future registerUser(RegisterUserModel body) async {
    return await _firebaseFirestore
        .collection('users')
        .doc()
        .set({'name': body.name, 'email': body.email});
  }

  Future registerUserAuth(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
