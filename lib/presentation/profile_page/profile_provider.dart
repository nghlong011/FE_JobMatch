import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

class ProfileProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool _succes = false;
  var _responseData;

  bool get succes => _succes;
  bool get isLoading => _isLoading;
  get responseData => _responseData;
  Future<void> getProfile(Map<String, dynamic> userData, String token) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.getProfile(userData, token);
      _isLoading = false;
      notifyListeners();
      _responseData = response.data['data'];
      if (response.data['messageCode'] == 'Lấy thông tin thành công') {
        _succes = true;
      } else {
        _succes = false;
      }
    } catch (error) {
      print('Error : $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
