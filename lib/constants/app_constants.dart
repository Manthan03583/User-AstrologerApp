import 'package:shared_preferences/shared_preferences.dart';

class AppConstants{
  //Urls
  static const baseUrl = "12b6-45-114-49-120.ngrok-free.app";
  static const loginUri = "";
  //Shared keys
  static const String accessToken = "accesstoken";
  static const String  refreshToken  = "refreshtoken";
  static const String  isSplashScreen = "splashscreen";
  static const String  acceptCookies = "acceptcookies";
  static const String  theme = "theme";
  static const String notification = 'notification';
  static const String notificationCount = 'notification_count';

  static Map<String, String> configHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static void setToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(token);
    prefs.setString(accessToken, token);
  }

  static Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(accessToken)??'';
    return stringValue;
  }
}
