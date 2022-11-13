import 'package:flutter/material.dart';
import 'package:trabalho/shared/provider_messager/provider_messages.dart';
import 'package:trabalho/shared/repositories/login/ilogin_repository.dart';
import 'package:trabalho/shared/repositories/login/login_repository.dart';

import '../../models/profile_model.dart';

class ProfileProvider with ChangeNotifier {
  final ILoginRepository _loginRepository = LoginRepository();
  final ProviderMessager _messager = ProviderMessager();
  ProfileModel myProfile = ProfileModel();
  bool alreadyGot = false;

  signout(BuildContext context) async {
    _messager.showMessage('Saindo..', context);
    await _loginRepository.signout().then((value) {
      Navigator.pushNamed(context, '/login');
      _messager.showMessage('Tchau ${myProfile.name}', context);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  getDataUser() async {
    if (!alreadyGot) {
      ProfileModel? user = await _loginRepository.getUserLogged();
      if (user != null) {
        myProfile = user;
      }
      notifyListeners();
      alreadyGot = true;
    }
  }
}
