import 'package:astrology_app/constants/app_constants.dart';
import 'package:astrology_app/services/api_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ProfileRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response?> getUserProfile() async {
    return await apiClient.getData(AppConstants.userProfile);
  }
}
