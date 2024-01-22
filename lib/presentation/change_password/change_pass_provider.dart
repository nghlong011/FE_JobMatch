import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

import '../login_screen/login.dart';

class ChangePass extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool _succes = false;

  bool get succes => _succes;
  bool get isLoading => _isLoading;
  Future<void> changePasswordUser(Map<String, dynamic> userData, context, String token) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.changePasswordUser(userData, token);
      _isLoading = false;
      notifyListeners();
      print(response.data['messageCode']);
      if (response.data['messageCode'] == 'Đổi mật khẩu thành công') {
        _succes = true;
      } else {
        _succes = false;
      }
    } catch (error) {
      print('Error registering user: $error');
    }
    _isLoading = false;
    notifyListeners();
  }

}
