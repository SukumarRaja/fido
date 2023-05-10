import 'package:get/get.dart';

class ShoppingController extends GetxController {
  static ShoppingController get to => Get.put(ShoppingController());

  final _mainMenuIndex = 0.obs;

  get mainMenuIndex => _mainMenuIndex.value;

  set mainMenuIndex(value) {
    _mainMenuIndex.value = value;
  }
}
