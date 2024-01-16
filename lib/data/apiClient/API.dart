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
  Future<Response> getJobEmployer(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/job/getJobFromEmail');
  }
  Future<Response> getJobApp(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/job/getJobApplyByUser');
  }
  Future<Response> getProfile(Map<String, dynamic> userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/profile/get', data: userData);
  }
  Future<Response> jobApp(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/jobapp/create', data: userData);
  }
  Future<Response> postJob(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/job/create', data: userData);
  }
  Future<Response> updateProfile(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/profile/update', data: userData);
  }

  Future<Response> findJobByTitle(String title) async {
    var ul = '$url/job/getByTitle/$title';
    return await _dio.get(ul);
  }
  Future<Response> dellJob(String title , String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    var ul = '$url/job/delete/$title';
    return await _dio.get(ul);
  }
  Future<Response> addSkill(Map<String, dynamic> userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/skill/create', data: userData);
  }
}
