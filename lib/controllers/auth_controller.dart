import 'package:astrology_app/controllers/aboutyourself_controller.dart';
import 'package:astrology_app/controllers/snackbar_controller.dart';
import 'package:astrology_app/repository/auth_repository.dart';
import 'package:astrology_app/utils/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool? _isLoading = false;
  final bool _acceptTerms = false;

  bool savedCookiesData = false;

  bool? get isLoading => _isLoading;
  bool get acceptTerms => _acceptTerms;

  var phoneController = TextEditingController();
  var otpController = TextEditingController();

  final snackbarController = Get.find<CustomSnackBarController>();

  setAccessToken(String token) => authRepo.setAccessToken(token);
  setRefreshToken(String refreshToken) => authRepo.setRefreshToken(refreshToken);
  setIsLogin(bool isLogin) => authRepo.setIsLogin(isLogin);
  Future<bool> getIsLogin() => authRepo.getIsLogin();

  Future<void> login() async {
    String phoneNumber = phoneController.value.text;
    _isLoading = true;
    update();
    Response? response = await authRepo.login(phone: phoneNumber);
    if (response != null) {
      if (response.statusCode == 200) {
        _isLoading = false;
        update();
        snackbarController.showSnackbar(title: response.data["message"].toString(), message: '');
        Get.toNamed("${Routes.otpScreen}?phonenumber=$phoneNumber");
      } else {
        _isLoading = false;
        update();
        snackbarController.showSnackbar(title: 'Something Went Worng', message: '');
      }
    }
  }

  Future<void> verify_otp() async {
    String phoneNumber = phoneController.value.text;
    String otp = otpController.value.text;
    _isLoading = true;
    update();
    Response? response = await authRepo.otp_verify(
      phone: phoneNumber,
      otp: otp,
    );
    if (response != null) {
      if (response.statusCode == 200 ) {
        _isLoading = false;
        update();
        snackbarController.showSnackbar(title: response.data["message"].toString(), message: '');
        setAccessToken(response.data['accessToken']);
        setRefreshToken(response.data['refreshToken']);
        setIsLogin(true);
        if (!await Get.find<AboutYourSelfController>()
                .getIsUserFilledDetails()) {
              Get.offNamed(Routes.tellusScreen,arguments: "from otp");
            } else {
              Get.offAllNamed(Routes.home);
            }
        
      } else {
        _isLoading = false;
        update();
       snackbarController.showSnackbar(title: "Something Went Worng", message: '');
        setIsLogin(false);
      }
    }
  } 
}
