import 'package:flutter/material.dart';
import 'package:trabalho/models/profile_model.dart';
import 'package:trabalho/shared/repositories/home/home_repository.dart';
import 'package:trabalho/shared/repositories/home/ihome_repository.dart';

class HomeProvider with ChangeNotifier {
  final IHomeRepository _homeRepository = HomeRepository();
  List<ProfileModel> profiles = [];
  List<ProfileModel> profilesCached = [];
  bool alreadyGot = false;

  getAllUsers() async {
    if (!alreadyGot) {
      profiles = await _homeRepository.getAllUsers();
      profilesCached = profiles;
      notifyListeners();
      alreadyGot = true;
    }
  }
}
