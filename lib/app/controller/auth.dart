import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/pages/initial.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  //login
  final TextEditingController lEmail = TextEditingController();
  final TextEditingController lPassword = TextEditingController();

  final _isLogin = true.obs;

  get isLogin => _isLogin.value;

  set isLogin(value) {
    _isLogin.value = value;
  }

  loginCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  checkOnBoarding() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var onBoard = pref.getString('on_boarding');
    if (onBoard != null && onBoard.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  storeLocalDevice({required Map body}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    body.forEach((key, value) {
      debugPrint('index=$key, value=$value');
      preferences.setString(key, value);
    });
  }

  setOnBoardDataAfterScreenCompleted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("on_boarding", "onBoarding");
    var onBoard = preferences.getString('on_boarding');
    debugPrint("on boarding data $onBoard");
    await Get.off(() => const Initial());
    return onBoard;
  }
}
