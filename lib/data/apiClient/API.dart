import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  var url = 'http://203.145.47.68:8081';

  Future<Response> registerUser(Map<String, dynamic> userData) async {
      return await _dio.post('$url/user/register', data: userData);
  }

  Future<Response> loginUser(Map<String, dynamic> userData) async {
      return await _dio.post('$url/user/login', data: userData);
  }

  Future<Response> getJob(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/company/getCompany');
  }

  Future<Response> jobApp(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/jobapp/create', data: userData);
  }
  Future<Response> findJobByTitle(String title) async {
    var ul= '$url/job/getByTitle/$title';
    return await _dio.get(ul);
  }
}
