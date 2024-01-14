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
  Future<void> searchTitle(String title, context) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.findJobByTitle(title);
      _isLoading = false;
      notifyListeners();
      _responseData = response.data['data'];
      if(response.data['messageCode'] == 'Lấy thông tin job thành công'){
        _succes = true;
      }else{
        _succes = false;
      }

    } catch (error) {
      print('Error : $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
