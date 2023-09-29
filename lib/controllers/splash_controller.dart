import 'package:astrology_app/constants/app_constants.dart';
import 'package:astrology_app/repository/splash_repository.dart';
import 'package:astrology_app/services/api_client.dart';
import 'package:get/get.dart';

class SplashController extends GetxController implements GetxService{
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});
  

  Future<bool> saveSplashSeenValue(bool value) async {
    return await splashRepo.setSplashSeen(value);
  }

  bool isSplashSeen() => splashRepo.isSplashSeen();
}