import 'package:trabalho/models/register_user_model.dart';

abstract class IRegisterRepository {
  Future<bool> registerUser(RegisterUserModel body);
}
