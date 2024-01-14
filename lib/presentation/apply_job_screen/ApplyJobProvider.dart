import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';


class ApplyJobProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool _succes = false;

  bool get succes => _succes;
  bool get isLoading => _isLoading;
  Future<void> jobApp(FormData userData,String token, context) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.jobApp(userData, token);
      _isLoading = false;
      notifyListeners();
      print(response.data['messageCode']);
      if(response.data['messageCode'] == 'Ứng tuyển thành công'){
        _succes = true;
      }else{
        _succes = false;
      }

    } catch (error) {
      print('Error registering user: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
