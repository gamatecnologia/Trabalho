import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:trabalho/models/profile_model.dart';
import 'package:trabalho/shared/repositories/login/ilogin_repository.dart';

class LoginRepository implements ILoginRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<ProfileModel?> doLogin(String email, String password) async {
    return await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      Map data = await getUser(value.user!.uid);
      ProfileModel profileModel = ProfileModel();
      profileModel = ProfileModel.fromJson(data);
      return profileModel;
    }).catchError((e) {
      debugPrint(e.toString());
      return null;
    });
  }

  @override
  Future<dynamic> getUser(String id) async {
    return (await _firebaseFirestore.collection('users').doc(id).get()).data();
  }

  @override
  Future<ProfileModel?> getUserLogged() async {
    if (_firebaseAuth.currentUser != null) {
      Map json = await getUser(_firebaseAuth.currentUser!.uid);
      ProfileModel profileModel = ProfileModel();
      profileModel = ProfileModel.fromJson(json);
      return profileModel;
    }
    return null;
  }

  @override
  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
