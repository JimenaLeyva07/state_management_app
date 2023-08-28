import 'package:flutter/material.dart';
import 'package:state_management_app/models/user_model.dart';

class UserService with ChangeNotifier {
  UserModel _userModel = UserModel.empty();

  UserModel get user => _userModel;
  bool get hasUser => _userModel.name != '' ? true : false;

  set user(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  void changeAge(int age) {
    _userModel = _userModel.copyWith(age: 25);
    notifyListeners();
  }

  void addProfession(String profession) {
    _userModel = _userModel.copyWith(
      professions: [..._userModel.professions, profession],
    );
    notifyListeners();
  }

  void deleteUser() {
    _userModel = UserModel.empty();
    notifyListeners();
  }
}
