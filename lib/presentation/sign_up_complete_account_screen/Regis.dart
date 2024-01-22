import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';


class RegistrationProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  var _responseData;

  bool get isLoading => _isLoading;
  get responseData => _responseData;
  Future<String> registerUser(Map<String, dynamic> userData, context,int role) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.registerUser(userData);
      _isLoading = false;
      notifyListeners();
      _responseData = response.data['messageCode'];
      print(_responseData);
      return _responseData;
    } catch (error) {
      print('Error registering user: $error');
    }
    _isLoading = false;
    notifyListeners();
    return '';
  }

  Future<void> loginUser(Map<String, dynamic> userData, context, int role) async {
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

        if(role  == 2){
          Navigator.pushNamed(context, AppRoutes.createCompanyScreen);
        }
      }
    } catch (error) {
      print('Error registering user: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
