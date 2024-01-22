// Trong tệp quản lý trạng thái (state management file):
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

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
  void logout(BuildContext context) {
    // Đặt lại trạng thái đăng nhập và thông báo sự thay đổi
    isLoggedIn = false;
    notifyListeners();

    // Chuyển hướng đến trang login

    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    Navigator.of(context).popUntil((route) => false);
  }
}

