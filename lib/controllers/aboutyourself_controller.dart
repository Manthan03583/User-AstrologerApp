import 'package:astrology_app/controllers/snackbar_controller.dart';
import 'package:astrology_app/repository/aboutyourself_repo.dart';
import 'package:astrology_app/utils/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class AboutYourSelfController extends GetxController {
  final AboutYourSelfRepo aboutyourselfrepo;
  AboutYourSelfController({required this.aboutyourselfrepo});

  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final placeController = TextEditingController();
  final gender = ''.obs;
  RxString apiDateFormat = ''.obs;
  dynamic argument = "".obs;

  Future<bool> getIsUserFilledDetails() =>
      aboutyourselfrepo.getIsUserFilledDetails();
  void setIsUserFilledDetails(bool ans) =>
      aboutyourselfrepo.setIsUserFilledDetails(ans);

  Future<void> updateUser() async {
    Response? response = await aboutyourselfrepo.updateUser(
        name: nameController.text,
        birthPlace: placeController.text,
        birthDate: "${apiDateFormat.value} ${timeController.text}",
        gender: gender.value.toLowerCase());
    if (response != null) {
      if (response.statusCode == 200) {
        setIsUserFilledDetails(true);
        Get.find<CustomSnackBarController>().showSnackbar(
            title: response.data["message"].toString(), message: '');
        if (argument == "from splash" || argument == "from otp") {
          Get.offAllNamed(Routes.home);
        } else {
          Get.back();
        }
      } else {
        Get.find<CustomSnackBarController>()
            .showSnackbar(message: '', title: "Something Went Wrong");
      }
    }
  }
}
