import 'package:amazon_clone/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: [],
  );
  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners(); // notify to rebuild
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners(); // notify to rebuild
  }
}
