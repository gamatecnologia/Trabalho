import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trabalho/models/profile_model.dart';
import 'package:trabalho/shared/repositories/home/ihome_repository.dart';

class HomeRepository implements IHomeRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<ProfileModel>> getAllUsers() async {
    List values = [];
    List<ProfileModel> profiles = [];
    var doc = await _firebaseFirestore.collection('users').get();
    if (doc.docs.isNotEmpty) {
      for (var element in doc.docs) {
        values.add(element.data());
      }
    }

    if (values.isNotEmpty) {
      for (var element in values) {
        if (element is Map) {
          ProfileModel profile = ProfileModel();
          profile = ProfileModel.fromJson(element);
          profiles.add(profile);
        }
      }
    }
    return profiles;
  }
}
