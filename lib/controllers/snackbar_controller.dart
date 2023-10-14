import 'package:get/get.dart';

class CustomSnackBarController extends GetxController {
  void showSnackbar({
    required String title,
    required String message,
    bool? isShowProgressbar,
    int? durationInSeconds,
  }) {
    Get.snackbar(
      title,
      message,
      showProgressIndicator: isShowProgressbar ?? false,
      duration: Duration(seconds: durationInSeconds??3),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
