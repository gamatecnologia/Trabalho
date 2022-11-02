import 'package:trabalho/shared/database/users_datasource.dart';
import 'package:trabalho/shared/repositories/register/iregister_repository.dart';

import '../../../models/register_user_model.dart';

class RegisterRepository implements IRegisterRepository {
  final UsersDataSource _usersDataSource = UsersDataSource();

  @override
  Future<bool> registerUser(RegisterUserModel body) async {
    return await _usersDataSource.registerUser(body).then((value) async {
      await _usersDataSource.registerUserAuth(body.email!, body.password!);
      return true;
    }).catchError((e) {
      print(e);
      return false;
    });
  }
}
