import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

class EditSkillProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool _succes = false;
  var _responseData;

  bool get succes => _succes;
  bool get isLoading => _isLoading;
  get responseData => _responseData;
  Future<void> addSkill(Map<String, dynamic> userData, String token , context) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.addSkill(userData, token);
      _isLoading = false;
      notifyListeners();
      _responseData = response.data['data'];
      if (response.data['messageCode'] == 'Tạo skill thành công') {
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
