
import 'package:astrology_app/constants/app_constants.dart';
import 'package:astrology_app/services/api_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> login({required String phone}) async {
    return await apiClient.postData(
        AppConstants.loginUri, {"phone_number": phone});
  }

  Future<Response?> otp_verify(
      {required String phone, required String otp}) async {
    return await apiClient.postData(
        AppConstants.otpVerifyUri, {"phone_number": phone, "otp": otp});
  }

  void setAccessToken(String token) async {
    apiClient.setAccessToken(token);
  }

  void setRefreshToken(String token) async {
    apiClient.setRefreshToken(token);
  }

  void setIsLogin(bool ans){
    sharedPreferences.setBool(AppConstants.isLogin, ans);
  }

  Future<bool> getIsLogin()async{
    return sharedPreferences.getBool(AppConstants.isLogin) ?? false;
  }

  
}
