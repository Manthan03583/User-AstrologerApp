import 'package:astrology_app/controllers/network_Controller.dart';
import 'package:get/get.dart';

class DependencyInjection{

  static void init(){
    Get.put<NetworkController>(NetworkController(),permanent: true);
  }
}