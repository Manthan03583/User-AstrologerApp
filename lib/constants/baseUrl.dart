import 'package:shared_preferences/shared_preferences.dart';

class AppConstants{
  static const baseUrl = "12b6-45-114-49-120.ngrok-free.app";
  static void setToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(token);
    prefs.setString("token", token);
  }

  static Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString("token")??'';
    return stringValue;
  }
}
