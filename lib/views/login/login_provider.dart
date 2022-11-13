import 'package:flutter/material.dart';
import 'package:trabalho/models/profile_model.dart';
import 'package:trabalho/shared/provider_messager/provider_messages.dart';
import 'package:trabalho/shared/repositories/login/ilogin_repository.dart';
import 'package:trabalho/shared/repositories/login/login_repository.dart';

class LoginProvider with ChangeNotifier {
  ProfileModel myProfile = ProfileModel();
  final ProviderMessager _messager = ProviderMessager();
  final ILoginRepository _loginRepository = LoginRepository();
  bool getting = false;

  doLogin(String email, String password, BuildContext context) async {
    doRequesting;
    notifyListeners();
    await _loginRepository.doLogin(email.trim(), password.trim()).then((value) {
      if (value == null) {
        _messager.showMessage('Não foi possível entrar', context);
        return null;
      }
      myProfile = value;
      _messager.showMessage('Bem vindo ${myProfile.name}', context);
      Navigator.pushNamed(context, '/home');
    }).catchError((e) {
      _messager.showMessage('Não foi possível entrar', context);
      debugPrint(e.toString());
    });
    doneRequest;
    notifyListeners();
  }

  autoLogin(BuildContext context) async {
    ProfileModel? user = await _loginRepository.getUserLogged();
    if (user != null) {
      myProfile = user;
      Navigator.pushNamed(context, '/home');
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  void get doRequesting => getting = true;
  void get doneRequest => getting = false;
}
