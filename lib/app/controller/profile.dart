import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());

  final TextEditingController ownerName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController language = TextEditingController();




}
