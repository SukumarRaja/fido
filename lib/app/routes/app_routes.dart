import 'package:get/get.dart';
import '../ui/pages/home/main.dart';
import '../ui/pages/login.dart';
import '../ui/pages/initial.dart';
import '../ui/pages/password/forgot.dart';
import '../ui/pages/password/reset.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: '/',
        page: () => const Initial(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/login',
        page: () => const Login(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/forgot',
        page: () => const ForgotPassword(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/reset',
        page: () => const ResetPassword(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/homeMain',
        page: () => HomeMain(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
