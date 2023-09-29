import 'package:astrology_app/onboarding/login_screen.dart';
import 'package:astrology_app/onboarding/splash_screen.dart';
import 'package:astrology_app/onboarding/onboarding_screen.dart';
import 'package:astrology_app/screens/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String verification = '/verification';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String profileEdit = '/profile-edit';
  static const String notification = '/notification';
  static const String chatScreen = '/chat-screen';
  static const String chatInbox = '/chat-inbox';
  static const String onBoardScreen = '/onBoardScreen';
  static const String settingScreen = '/settingScreen';
  static const String myWallet = '/my-wallet';
  static const String otpScreen = '/otpscreen';

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplassPage(),
    ),
    GetPage(
      name: onBoardScreen,
      page: () => const OnBoarding(),
    ),
    GetPage(
      name: signIn,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: home,
      page: () => const HomePage(),
    ),
  ];
}
