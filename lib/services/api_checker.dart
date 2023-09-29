// import 'package:astrology_app/controllers/auth_controller.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/response/response.dart';

// class ApiChecker {
//   static void checkApi(Response response) {
//     if(response.statusCode == 401) {
//       Get.find<AuthController>().clearSharedData();
//       if(Get.currentRoute!=Routes.getSignInRoute('splash')){
//         Get.offAllNamed(RouteHelper.getSignInRoute(RouteHelper.main));
//       }
//     }else{
//       customSnackBar("${response.statusCode!}".tr);
//     }
//   }
// }