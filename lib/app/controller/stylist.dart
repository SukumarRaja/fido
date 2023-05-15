import 'package:get/get.dart';

class StylistController extends GetxController {
  static StylistController get to => Get.put(StylistController());

  final _selectIndex = 0.obs;

  get selectIndex => _selectIndex.value;

  set selectIndex(value) {
    _selectIndex.value = value;
  }
}
