import 'package:get/get.dart';
import '../ui/pages/cart.dart';
import '../ui/pages/home/main.dart';
import '../ui/pages/login.dart';
import '../ui/pages/initial.dart';
import '../ui/pages/password/forgot.dart';
import '../ui/pages/password/reset.dart';
import '../ui/pages/product_detail.dart';
import '../ui/pages/wish_list.dart';

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
    GetPage(
        name: '/cart',
        page: () => const Cart(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/wish_list',
        page: () => const WishList(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/product_detail',
        page: () =>  ProductDetail(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
