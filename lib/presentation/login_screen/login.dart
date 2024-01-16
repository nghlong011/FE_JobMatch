import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

import '../../data/repository/auth.dart';

class LoginProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> loginUser(Map<String, dynamic> userData, context) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.loginUser(userData);
      _isLoading = false;
      notifyListeners();
      var data = response.data['data'];
      if (data == null) {
        print('Đăng nhập thất bại');
      } else {
        var token = data['token'];
        saveToken(token);
        print(token);
        Map<String, dynamic>? decodedToken = JwtDecoder.decode(token!);

        String? userName = decodedToken['sub'];
        String? role = decodedToken['jti'];
        Provider.of<AuthProvider>(context, listen: false).isLoggedIn = true;
        Provider.of<AuthProvider>(context, listen: false).userType = true;
        if(role  == 'ROLE_EMPLOYER'){Navigator.pushNamed(context, AppRoutes.homeEmployer);}
        else {
          Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
        }

      }
    } catch (error) {
      print('Error registering user: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
