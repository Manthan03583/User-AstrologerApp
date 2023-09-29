import 'package:astrology_app/constants/app_constants.dart';
import 'package:astrology_app/services/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo{
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;
  SplashRepo({ required this.apiClient, required this.sharedPreferences});


  bool isSplashSeen() {
    return sharedPreferences.getBool(AppConstants.isSplashScreen) != null ? sharedPreferences.getBool(AppConstants.isSplashScreen)! : false;
  }

  Future<bool> setSplashSeen(bool isSplashSeen) async {
    return await sharedPreferences.setBool(AppConstants.isSplashScreen, isSplashSeen);
  }
}