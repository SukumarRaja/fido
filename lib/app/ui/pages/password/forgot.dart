import 'package:fido/app/controller/auth.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/common_textform.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/otp.dart';
import '../../widgets/common/otp_pinput.dart';
import '../../widgets/main_clip_path.dart';
import 'reset.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const MainClipPath(),
                  Obx(() => AuthController.to.isNavigateOtpPage == true
                      ? GestureDetector(
                          onTap: () {
                            AuthController.to.isNavigateOtpPage = false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: AppColors.white,
                                  size: 18,
                                ),
                                CommonText(
                                    text: "OTP",
                                    style: headText(
                                        color: AppColors.white, fontSize: 20)),
                              ],
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: AppColors.white,
                                  size: 18,
                                ),
                                CommonText(
                                    text: "Forgot Password",
                                    style: headText(
                                        color: AppColors.white, fontSize: 20)),
                              ],
                            ),
                          ),
                        ))
                ],
              ),
              Obx(() => AuthController.to.isNavigateOtpPage == true
                  ? buildOTP()
                  : buildForgot()),
            ],
          ),
        ),
      ),
    );
  }

  Column buildOTP() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 280, child: SvgPicture.asset("assets/images/svgs/otp.svg")),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: CommonText(
            text:
                "Please type the OTP as shared\non your ${AuthController.to.vEmail.text}",
            style: regularText(),
          ),
        ),
        const SizedBox(height: 15),
        Form(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInput(autoFocus: true, controller: OtpController.to.first),
                OtpInput(autoFocus: false, controller: OtpController.to.second),
                OtpInput(autoFocus: false, controller: OtpController.to.third),
                OtpInput(autoFocus: false, controller: OtpController.to.fourth),
                OtpInput(autoFocus: false, controller: OtpController.to.fifth),
                OtpInput(autoFocus: false, controller: OtpController.to.sixth),
              ],
            ),
          ],
        )),
        const SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 30),
          child: CommonButton(
            text: "Verify OTP",
            onTap: () {
              Get.toNamed('/reset');
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: "Didn't receive?",
              style: regularText(),
            ),
            const SizedBox(width: 15),
            Obx(() => GestureDetector(
                onTap: OtpController.to.isStartResend == true
                    ? null
                    : () {
                        OtpController.to.startTimer();
                      },
                child: CommonText(
                  text: "Resend OTP",
                  style: mediumText(
                      color: OtpController.to.isStartResend == true
                          ? AppColors.black.withOpacity(.3)
                          : AppColors.secondary),
                ))),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(() => OtpController.to.isStartResend == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: CommonText(
                        text:
                            "Otp auto resend in ${OtpController.to.seconds} secs",
                        style: regularText(),
                      )),
                ],
              )
            : const SizedBox()),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Column buildForgot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 280,
            child: SvgPicture.asset('assets/images/svgs/forgot_password.svg')),
        Container(
          alignment: Alignment.center,
          child: CommonText(
              text:
                  "Don’t worry! It happens. Please enter the address\nassociated with your account",
              style: regularText()),
        ),
        const SizedBox(height: 15),
        CommonTextFormField(
          hintText: "Enter email",
          controller: AuthController.to.lEmail,
          validator: (data) {
            if (data == null || data.isEmpty || data == "") {
              return "Please enter email";
            }
            return null;
          },
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 30),
          child: CommonButton(
            text: "Send OTP",
            onTap: () {
              AuthController.to.isNavigateOtpPage = true;
            },
          ),
        ),
      ],
    );
  }
}
