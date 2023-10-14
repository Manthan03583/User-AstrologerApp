import 'package:astrology_app/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  SharedPreferences? sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences!.clear();
  }
}
