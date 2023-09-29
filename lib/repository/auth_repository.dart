import 'dart:convert';
import 'package:astrology_app/constants/app_constants.dart';
import 'package:astrology_app/services/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  // Future<Response?> registration() async {
  //   return await apiClient.postData(AppConstants.registerUri, signUpBody.toJson());
  // }

  
}
