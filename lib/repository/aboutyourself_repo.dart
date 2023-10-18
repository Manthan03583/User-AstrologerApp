import 'package:astrology_app/constants/app_constants.dart';
import 'package:astrology_app/services/api_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutYourSelfRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AboutYourSelfRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> updateUser({
    required String name,
    required String birthPlace,
    required String birthDate,
    required String gender,
  }) async {
    return await apiClient.postData(AppConstants.userProfile, {
      "name": name,
      "place_of_birth": birthPlace,
      "date_of_birth": birthDate,
      "gender": gender
    });
  }

  void setIsUserFilledDetails(bool ans) {
    sharedPreferences.setBool(AppConstants.isUserFilledDetails, ans);
  }

  Future<bool> getIsUserFilledDetails() async {
    return sharedPreferences.getBool(AppConstants.isUserFilledDetails) ?? false;
  }
}
