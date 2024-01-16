import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

class UpdateProfile extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool _succes = false;

  bool get succes => _succes;
  bool get isLoading => _isLoading;
  Future<void> updateProfile(FormData userData, String token, context) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.updateProfile(userData, token);
      _isLoading = false;
      notifyListeners();
      if (response.data['messageCode'] == 'Chỉnh sửa thông tin profile thành công') {
        _succes = true;
      } else {
        _succes = false;
      }
    } catch (error) {
      print('Error: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
