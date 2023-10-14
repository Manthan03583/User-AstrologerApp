import 'package:shared_preferences/shared_preferences.dart';

class AppConstants{
  //Urls

  static const baseUrl = "https://astrology.f2fdigital.in";
  static const loginUri = "/user/login";
  static const otpVerifyUri = "/user/verify";
  static const refreshUri = "/user/refresh";
  static const profileUser = "/user/profile";
  static const updateUserProfile = "/user/profile";
  static const updateUser = "/user";
  static const userFollowing = "/user/following";

  //Shared keys
  static const String phoneNumber = "phone_number";
  static const String accessToken = "accesstoken";
  static const String  refreshToken  = "refreshtoken";
  static const String  isSplashScreen = "splashscreen";
  static const String  isLogin = "isLogin";
  static const String  theme = "theme";
  static const String notification = 'notification';
  static const String notificationCount = 'notification_count';
  static const String isUserFilledDetails = 'isUserFilledDetails';

  static Map<String, dynamic> configheader = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
    'Connection': 'keep-alive'
  };
}
