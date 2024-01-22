import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/presentation/home_user/home_user.dart';



class LoginProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loginUserFireBase(Map<String, dynamic> userData) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: userData['email'], password: userData['password']);
      print('User logged in: ${userCredential.user?.email}');
    } catch (e) {
      print('Error during login: $e');
    }
  }
  Future<void> loginUser(Map<String, dynamic> userData, context) async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.loginUser(userData);
      _isLoading = false;
      notifyListeners();
      var data = response.data['data'];
      print(userData);
      if (data == null) {
        print('Đăng nhập thất bại');
      } else {
        await loginUserFireBase(userData);
        var token = data['token'];
        saveToken(token);
        Map<String, dynamic>? decodedToken = JwtDecoder.decode(token!);
        String? userName = decodedToken['sub'];
        String? role = decodedToken['jti'];
        if(role  == 'ROLE_JOB_SEEKER'){
          Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
        }
        else if(role == 'ROLE_EMPLOYER'){
            Navigator.pushNamed(context, AppRoutes.homeEmployer);
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageAdmin()));
        }

      }
    } catch (error) {
      print('Error registering user: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
