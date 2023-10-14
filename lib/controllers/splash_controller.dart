import 'package:astrology_app/controllers/auth_controller.dart';
import 'package:astrology_app/repository/splash_repository.dart';
import 'package:astrology_app/utils/routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class SplashController extends GetxController {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});

  Future<bool> saveSplashSeenValue(bool value) async {
    return await splashRepo.setSplashSeen(value);
  }

  bool isSplashSeen() => splashRepo.isSplashSeen();
}
