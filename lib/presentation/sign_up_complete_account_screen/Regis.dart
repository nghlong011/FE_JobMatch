import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';


class RegistrationProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> registerUser(Map<String, dynamic> userData, context) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.registerUser(userData);
      _isLoading = false;
      notifyListeners();
      print(response.data['messageCode']);
      Navigator.pushNamed(context, AppRoutes.loginScreen);

    } catch (error) {
      print('Error registering user: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
