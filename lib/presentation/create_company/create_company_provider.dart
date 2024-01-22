import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

class CreateCompanyProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool _succes = false;

  bool get succes => _succes;
  bool get isLoading => _isLoading;
  Future<void> createCompany(FormData userData, String token, context) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.createCompany(userData, token);
      _isLoading = false;
      notifyListeners();
      Navigator.pushNamed(context, AppRoutes.homeEmployer);
      if (response.data['messageCode'] == 'Tạo công ty thành công') {
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
