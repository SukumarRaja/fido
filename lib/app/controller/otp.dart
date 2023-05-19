import 'dart:async';
import 'package:fido/app/config/config.dart';
import 'package:fido/app/controller/auth.dart';
import 'package:fido/app/ui/pages/home/main.dart';
import 'package:fido/app/ui/pages/initial.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/widgets/common/toast.dart';

class OtpController extends GetxController {
  static OtpController get to => Get.put(OtpController());

  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();
  TextEditingController fifth = TextEditingController();
  TextEditingController sixth = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  late Timer timer;

  final _seconds = 0.obs;

  get seconds => _seconds.value;

  set seconds(value) {
    _seconds.value = value;
  }

  final _isShowOtpField = false.obs;

  get isShowOtpField => _isShowOtpField.value;

  set isShowOtpField(value) {
    _isShowOtpField.value = value;
  }

  final _isOtpVerified = false.obs;

  get isOtpVerified => _isOtpVerified.value;

  set isOtpVerified(value) {
    _isOtpVerified.value = value;
  }

  final _isStartResend = false.obs;

  get isStartResend => _isStartResend.value;

  set isStartResend(value) {
    _isStartResend.value = value;
  }

  final _isLive = false.obs;

  get isLive => _isLive.value;

  set isLive(value) {
    _isLive.value = value;
  }

  final _loading = false.obs;

  get loading => _loading.value;

  set loading(value) {
    _loading.value = value;
  }

  final _isResendOtp = false.obs;

  get isResendOtp => _isResendOtp.value;

  set isResendOtp(value) {
    _isResendOtp.value = value;
  }

  final _verifyingOtp = false.obs;

  get verifyingOtp => _verifyingOtp.value;

  set verifyingOtp(value) {
    _verifyingOtp.value = value;
  }

  final _codeVerificationId = "".obs;

  get codeVerificationId => _codeVerificationId.value;

  set codeVerificationId(value) {
    _codeVerificationId.value = value;
  }

  startTimer() {
    seconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds = seconds - 1;
      isStartResend = true;
      if (seconds == 0) {
        timer.cancel();
        timer.cancel();
      }
      update();
      if (seconds == 0) {
        timer.cancel();
        isStartResend = false;
      }
    });
  }

  clearOtpFields() {
    first.text = "";
    second.text = "";
    third.text = "";
    fourth.text = "";
    fifth.text = "";
    sixth.text = "";
  }

  sendOtp({required bool isRegister}) async {
    isLive = false;
    loading = true;
    Future.delayed(const Duration(seconds: 2), () async {
      loading = false;
      if (AuthController.to.phone.text == AppConfig.testingPhone) {
        AuthController.to.phone.text = "";
        if (isRegister == false) {
          AuthController.to.isNavigateOtpPage = true;
        }
      } else {
        isLive = true;
        if (isLive == true) {
          loading = true;
          debugPrint("phone number ${AuthController.to.phone.text}");
          verificationCompleted(AuthCredential cred) {
            loading = false;
            if (isRegister == false) {
              AuthController.to.isNavigateOtpPage = true;
              // if (isRegister == true) {
              //   verifyOtp(isRegister: isRegister);
              // }
            }
          }

          verificationFailed(FirebaseAuthException exception) {
            loading = false;
            commonToast(msg: "Verification failed Please try again later");
            debugPrint(
                'verificationFailed Code: ${exception.code}\nMessage: ${exception.message}');
          }

          codeSent(String verificationId, [int? resendToken]) {
            debugPrint("code sent to ${AuthController.to.phone.text}");
            if (verificationId.isEmpty) {
              debugPrint("verification id error");
              loading = false;
              isShowOtpField = false;
            } else {
              codeVerificationId = verificationId;
              loading = false;
              isShowOtpField = true;
              commonToast(
                  msg: "Code send to : ${AuthController.to.phone.text}");
              if (isResendOtp == false) {
                AuthController.to.isNavigateOtpPage = true;
              }
            }
          }

          codeAutoRetrievalTimeout(String verificationId) {
            codeVerificationId = verificationId;
            loading = false;
            debugPrint("Authentication failed Timeout. please try again");
            commonToast(msg: "Authentication failed Timeout. please try again");
          }

          try {
            await auth.verifyPhoneNumber(
                phoneNumber: "+91 ${AuthController.to.phone.text}",
                verificationCompleted: verificationCompleted,
                timeout: const Duration(seconds: 120),
                verificationFailed: verificationFailed,
                codeSent: codeSent,
                codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
          } catch (e) {
            loading = false;
            debugPrint("Error from server on otpVerification $e");
          }
        }
      }
    });
  }

  verifyOtp({required bool isRegister}) async {
    if (isLive == true) {
      verifyingOtp = true;
      debugPrint(
          "entered otp is ${first.text + second.text + third.text + fourth.text + fifth.text + sixth.text}");
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: codeVerificationId,
        smsCode: isRegister == true
            ? AuthController.to.registerOtp.text
            : first.text +
                second.text +
                third.text +
                fourth.text +
                fifth.text +
                sixth.text,
      );
      final UserCredential user = await auth.signInWithCredential(credential);

      debugPrint("Successfully signed in UID: ${credential.providerId}");
      verifyingOtp = false;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("uid", user.user!.uid);
      var uid = preferences.getString('token');
      debugPrint("Successfully stored token(UID) in device: $uid");
      if (isRegister == true) {
        AuthController.to.phone.text = "";
        Get.toNamed('/');
      } else {
        AuthController.to.phone.text = "";
        Get.toNamed('/reset');
      }
    } else {
      verifyingOtp = true;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("uid", "123456");
      Future.delayed(const Duration(seconds: 2), () async {
        verifyingOtp = false;
        AuthController.to.phone.text = "";
        clearOtpFields();
        debugPrint("This an testing account");
        debugPrint("Testing otp is 123456");
        debugPrint(
            "Testing entered otp is ${first.text + second.text + third.text + fourth.text + fifth.text + sixth.text}");
        if (isRegister == true) {
          Get.toNamed('/');
        } else {
          Get.toNamed('/reset');
        }
      });
    }
  }
}
