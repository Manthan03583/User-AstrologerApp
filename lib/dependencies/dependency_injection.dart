import 'package:astrology_app/constants/app_constants.dart';
import 'package:astrology_app/controllers/SharedPreferencesController.dart';
import 'package:astrology_app/controllers/aboutyourself_controller.dart';
import 'package:astrology_app/controllers/profile_controllers.dart';
import 'package:astrology_app/controllers/services.dart';
import 'package:astrology_app/controllers/auth_controller.dart';
import 'package:astrology_app/controllers/network_Controller.dart';
import 'package:astrology_app/controllers/snackbar_controller.dart';
import 'package:astrology_app/controllers/splash_controller.dart';
import 'package:astrology_app/repository/aboutyourself_repo.dart';
import 'package:astrology_app/repository/auth_repository.dart';
import 'package:astrology_app/repository/profile_repository.dart';
import 'package:astrology_app/repository/splash_repository.dart';
import 'package:astrology_app/services/api_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    //core
    await Get.putAsync(() async => SharedPreferencesController());
    Get.lazyPut(
      () => ApiClient(
        sharedPreferences:
            Get.find<SharedPreferencesController>().sharedPreferences!,
      ),
    );
    Get.lazyPut<CustomSnackBarController>(() => CustomSnackBarController(),
        fenix: true);
    Get.lazyPut<NetworkController>(
      () => NetworkController(),
      fenix: true,
    );
    Get.lazyPut<SplashController>(
      () => SplashController(
          splashRepo: SplashRepo(
        sharedPreferences:
            Get.find<SharedPreferencesController>().sharedPreferences!,
        apiClient: Get.find(),
      )),
      fenix: true,
    );
    Get.lazyPut<AuthController>(() => AuthController(
            authRepo: AuthRepo(
          sharedPreferences:
              Get.find<SharedPreferencesController>().sharedPreferences!,
          apiClient: Get.find(),
        )));

    Get.lazyPut<ServiceController>(() => ServiceController());

    Get.lazyPut<AboutYourSelfController>(() => AboutYourSelfController(
            aboutyourselfrepo: AboutYourSelfRepo(
          apiClient: Get.find(),
          sharedPreferences:
              Get.find<SharedPreferencesController>().sharedPreferences!,
        )));

    Get.lazyPut<ProfileController>(() => ProfileController(
            profileRepo: ProfileRepo(
          apiClient: Get.find(),
          sharedPreferences:
              Get.find<SharedPreferencesController>().sharedPreferences!,
        )));
  }
}
