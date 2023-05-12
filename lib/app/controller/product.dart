import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.put(ProductController());

  final _productMenuIndex = 0.obs;

  get productMenuIndex => _productMenuIndex.value;

  set productMenuIndex(value) {
    _productMenuIndex.value = value;
  }
}
