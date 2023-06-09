import 'package:get/get.dart';
import '../ui/pages/address/add.dart';
import '../ui/pages/address/list.dart';
import '../ui/pages/cart.dart';
import '../ui/pages/home/home.dart';
import '../ui/pages/home/main.dart';
import '../ui/pages/login.dart';
import '../ui/pages/initial.dart';
import '../ui/pages/matching/matching_pets_list.dart';
import '../ui/pages/matching/pet_details.dart';
import '../ui/pages/my_orders.dart';
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
        page: () => const ProductDetail(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/my_orders',
        page: () => const MyOrders(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/addresses',
        page: () => const Addresses(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/home',
        page: () => const Home(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/add_address',
        page: () => const AddAddress(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/matching_pets',
        page: () => const MatchingPetList(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: '/matching_pet_detail',
        page: () => const MatchingPetDetail(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
