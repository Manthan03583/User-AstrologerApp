import 'package:astrology_app/constants/app_constants.dart';
import 'package:astrology_app/constants/services.dart';
import 'package:astrology_app/controllers/auth_controller.dart';
import 'package:astrology_app/controllers/network_Controller.dart';
import 'package:astrology_app/controllers/splash_controller.dart';
import 'package:astrology_app/repository/auth_repository.dart';
import 'package:astrology_app/repository/splash_repository.dart';
import 'package:astrology_app/services/api_client.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static void init() async {
    //core
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(
      () => ApiClient(
        appBaseUrl: AppConstants.baseUrl,
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut<NetworkController>(
      () => NetworkController(),
      fenix: true,
    );
    Get.lazyPut<SplashController>(() => SplashController(
            splashRepo: SplashRepo(
          sharedPreferences: Get.find(),
          apiClient: Get.find(),
        )));
    Get.lazyPut<AuthController>(() => AuthController(
            authRepo: AuthRepo(
          sharedPreferences: Get.find(),
          apiClient: Get.find(),
        )));

    Get.lazyPut<ServiceController>(() => ServiceController());
  }
}
