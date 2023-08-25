import 'dart:async';

import 'package:state_management_app/models/user_model.dart';

class _UserService {
  UserModel _userModel = UserModel.empty();

  final StreamController<UserModel> _userStreamController =
      StreamController<UserModel>.broadcast();

  UserModel get user => _userModel;
  bool get hasUser => _userModel.name != '' ? true : false;
  Stream<UserModel> get userStream => _userStreamController.stream;

  void loadUser(UserModel user) {
    _userModel = user;
    _userStreamController.add(_userModel);
  }

  void setAge(int age) {
    _userModel = _userModel.copyWith(age: age);
    _userStreamController.add(_userModel);
  }

  void dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();
