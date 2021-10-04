import 'package:flutter/material.dart';

import 'model/user.dart';

class Auth with ChangeNotifier {
  bool isLoggedIn = false;
  User? user;

  loginUser(User user) {
    isLoggedIn = true;
    this.user = user;
    notifyListeners();
  }

  loginOut() {
    isLoggedIn = false;
    notifyListeners();
  }
}
