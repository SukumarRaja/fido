import 'package:get/get.dart';

class DoctorController extends GetxController {
  static DoctorController get to => Get.put(DoctorController());

  final _timeIndex = 0.obs;

  get timeIndex => _timeIndex.value;

  set timeIndex(value) {
    _timeIndex.value = value;
  }
}
