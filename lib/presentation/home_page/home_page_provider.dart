import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

class GetJobProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  var _responseData;

  bool get isLoading => _isLoading;
  get responseData => _responseData;
  Future<void> getJob(String token) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.getJob(token);
      _isLoading = false;
      notifyListeners();
      _responseData = response.data['data'];
    } catch (error) {
      print('Error list job: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
