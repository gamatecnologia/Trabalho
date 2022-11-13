import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/profile_model.dart';

abstract class ILoginRepository {
  Future<ProfileModel?> doLogin(String email, String password);
  Future<dynamic> getUser(String id);
  Future<ProfileModel?> getUserLogged();
  Future<void> signout();
}
