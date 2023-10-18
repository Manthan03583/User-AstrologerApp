import 'package:astrology_app/controllers/aboutyourself_controller.dart';
import 'package:astrology_app/repository/profile_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileRepo profileRepo;
  ProfileController({
    required this.profileRepo,
  });

  Future<void> checkProfile() async {
    final response = await profileRepo.getUserProfile();

    if (response != null) {
      if (response.statusCode == 200) {
        if (response.data["user"].containsValue(null)) {
          Get.find<AboutYourSelfController>().setIsUserFilledDetails(false);
        } else {
          Get.find<AboutYourSelfController>().setIsUserFilledDetails(true);
        }
      }
      
    }
  }
}
