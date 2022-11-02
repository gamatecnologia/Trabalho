import 'package:flutter/material.dart';
import 'package:trabalho/models/register_user_model.dart';
import 'package:trabalho/shared/provider_messager/provider_messages.dart';
import 'package:trabalho/shared/repositories/register/iregister_repository.dart';
import 'package:trabalho/shared/repositories/register/register_repository.dart';

class RegisterProvider with ChangeNotifier {
  RegisterUserModel userModel = RegisterUserModel();
  final IRegisterRepository _registerRepository = RegisterRepository();
  final ProviderMessager _messageModel = ProviderMessager();

  validDataAndRegister(BuildContext context) async {
    var valid = userModel.validData(userModel);
    if (valid == '') {
      await _registerRepository.registerUser(userModel).then((value) {
        if (value) {
          _messageModel.showMessage('Usuário cadastrado com sucesso!', context);
          return Navigator.pushNamed(context, '/login');
        }
        _messageModel.showMessage('Erro ao cadastrar usuário!', context);
      }).catchError((e) {
        _messageModel.showMessage('Erro ao cadastrar usuário!', context);
      });
    } else {
      _messageModel.showMessage(valid, context);
    }
  }
}
