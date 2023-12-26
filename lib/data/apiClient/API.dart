import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  var url = 'https://jobmatch.loingyn.com';

  Future<Response> registerUser(Map<String, dynamic> userData) async {
    try {
      return await _dio.post('$url/user/register', data: userData);
    } catch (error) {
      throw error;
    }
  }
}
