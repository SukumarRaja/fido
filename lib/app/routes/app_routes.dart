import 'package:get/get.dart';
import '../ui/pages/auth/login.dart';
import '../ui/pages/initial.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: '/',
        page: () => const Initial(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(seconds: 2)),
    GetPage(
        name: '/login',
        page: () => const Login(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(seconds: 2)),
  ];
}
