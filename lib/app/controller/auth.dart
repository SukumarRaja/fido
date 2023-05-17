import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ui/pages/initial.dart';
import '../ui/widgets/common/app_update.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  //login
  final TextEditingController lEmail = TextEditingController();
  final TextEditingController lPassword = TextEditingController();

  //register
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  //verify email
  final TextEditingController vEmail = TextEditingController();

  //reset password
  final TextEditingController uPassword = TextEditingController();
  final TextEditingController cuPassword = TextEditingController();

  final _isLogin = true.obs;

  get isLogin => _isLogin.value;

  set isLogin(value) {
    _isLogin.value = value;
  }

  final _isNavigateOtpPage = false.obs;

  get isNavigateOtpPage => _isNavigateOtpPage.value;

  set isNavigateOtpPage(value) {
    _isNavigateOtpPage.value = value;
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

  checkIsUpdateAvailable() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetch();
    await remoteConfig.fetchAndActivate();
    final info = await PackageInfo.fromPlatform();

    // get local app version and change to int
    var lv = info.version;
    var split = lv.replaceAll(".", "");
    var localVersion = int.parse(split);
    debugPrint("local version $lv");
    debugPrint("convert local version $localVersion");

    // get remote app version and change to int
    var rv = remoteConfig.getString('android');
    print("rc is $rv");
    var rSplit = rv.replaceAll(".", "");
    var remoteVersion = int.parse(rSplit);
    debugPrint("remote version $rv");
    debugPrint("convert remote version $remoteVersion");

    if (localVersion > remoteVersion) {
      debugPrint("update available");
      if (Platform.isAndroid || Platform.isIOS) {
        final appId = Platform.isAndroid ? 'limitless.fido' : 'YOUR_IOS_APP_ID';
        final url = Uri.parse(
          Platform.isAndroid
              ? "https://play.google.com/store/apps/details?id=$appId"
              : "https://apps.apple.com/app/id$appId",
        );

        updateAlertDialog(Get.context!,
            content:
                "Fido app is update available\nWish you update please click update button\nOtherwise cancel or tap anywhere to close",
            confirmButtonPressed: () {
          launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        });
      }
    } else {
      debugPrint("update not available");
    }
  }
}
