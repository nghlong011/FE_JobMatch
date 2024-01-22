import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  var url = 'http://203.145.47.68:8081';
  //Job create
  Future<Response> postJob(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/job/create', data: userData);
  }

  //Job dell
  Future<Response> dellJob(String title , String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    var ul = '$url/job/delete/$title';
    return await _dio.get(ul);
  }

  //Job update
  Future<Response> updateJob(FormData userData, String token, String jobId) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/job/update/$jobId', data: userData);
  }

  //Job from email
  Future<Response> getJobEmployer(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/job/getJobFromEmail');
  }

  //Job apply
  Future<Response> getJobApp(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/job/getJobApplyByUser');
  }



  //JobImage crud
  Future<Response> createJobImage(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/jobImages/create', data: userData);
  }

  Future<Response> updateJobImage(FormData userData, String token, String id) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/jobImages/update/$id', data: userData);
  }

  Future<Response> delJobImage(FormData userData, String token, String id) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/jobImages/delete/$id', data: userData);
  }
  //User
  Future<Response> registerUser(Map<String, dynamic> userData) async {
    return await _dio.post('$url/user/register', data: userData);
  }

  Future<Response> loginUser(Map<String, dynamic> userData) async {
    return await _dio.post('$url/user/login', data: userData);
  }
  Future<Response> changePasswordUser(Map<String, dynamic> userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/user/changePassword', data: userData);
  }
  Future<Response> getUserByJobAppId(Map<String, dynamic> userData,String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/user/getUserByJobAppId', data: userData);
  }
  Future<Response> dellUser(String token,String id) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/user/del/$id');
  }
  Future<Response> getUser(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/user/getAll');
  }

  //Company
  Future<Response> getJob(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/company/getCompany');
  }
  Future<Response> createCompany(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/company/create', data: userData);
  }

  //CompanyImage crud
  Future<Response> createCompanyImage(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/companyImage/create', data: userData);
  }

  Future<Response> updateCompanyImage(FormData userData, String token, String id) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/companyImage/update/$id', data: userData);
  }

  Future<Response> delCompanyImage(FormData userData, String token, String id) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/companyImage/delete/$id', data: userData);
  }
  //Profile
  Future<Response> createProfile(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/profile/create', data: userData);
  }
  Future<Response> updateProfile(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/profile/update', data: userData);
  }

  Future<Response> getProfile(Map<String, dynamic> userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/profile/get', data: userData);
  }

  //JobApp
  Future<Response> jobApp(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/jobapp/create', data: userData);
  }
  Future<Response> getUserHaventApply( String token, String id) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.get('$url/jobapp/getUserHaventApply/$id');
  }
  Future<Response> updateJobApp(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/jobapp/update', data: userData);
  }
  //Category
  Future<Response> createCategory(FormData userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/category/create', data: userData);
  }
  Future<Response> getJobCategory(String id) async {
    return await _dio.get('$url/category/get/$id');
  }
  Future<Response> getAllCategory() async {
    return await _dio.get('$url/category/getAll');
  }
  //Skill
  Future<Response> addSkill(Map<String, dynamic> userData, String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.post('$url/skill/create', data: userData);
  }
  Future<Response> updateSkill(Map<String, dynamic> userData, String token, String id) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.delete('$url/skill/update/$id', data: userData);
  }
  Future<Response> delSkill( String token, String id) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    return await _dio.put('$url/skill/delete/$id');
  }
}
