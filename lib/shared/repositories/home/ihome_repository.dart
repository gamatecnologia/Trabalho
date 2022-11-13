import '../../../models/profile_model.dart';

abstract class IHomeRepository {
  Future<List<ProfileModel>> getAllUsers();
}
