import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

class SearchProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool _succes = false;
  var _responseData;

  bool get succes => _succes;
  bool get isLoading => _isLoading;
  get responseData => _responseData;
  Future<void> dellJob(String title,String token , context) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.dellJob(title,token);
      _isLoading = false;

      notifyListeners();
      _responseData = response.data['data'];
      if (response.data['messageCode'] == 'Xoá job thành công') {
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
  void updateState() {
    notifyListeners();
  }

}
