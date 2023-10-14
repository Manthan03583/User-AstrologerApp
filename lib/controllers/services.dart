import 'dart:developer';

import 'package:get/get.dart';

class ServiceController extends GetxController {
  RxInt menuStatusValue = 0.obs;

  void menuslide() {
    menuStatusValue.value == 0
        ? menuStatusValue.value = 1
        : menuStatusValue.value = 0;
    log("VAL ${menuStatusValue.value}");
  }
}
