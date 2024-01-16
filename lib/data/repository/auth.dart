// Trong tệp quản lý trạng thái (state management file):
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _userType = false; // Thêm biến cục bộ `_userType`

  bool get isLoggedIn => _isLoggedIn;
  bool get userType => _userType; // Getter cho biến `_userType`

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  // Setter cho biến `_userType`
  set userType(bool value) {
    _userType = value;
    notifyListeners();
  }
}

