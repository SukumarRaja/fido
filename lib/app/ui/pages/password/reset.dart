import 'package:fido/app/controller/auth.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/common_textform.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../widgets/main_clip_path.dart';
import '../login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

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
                  GestureDetector(
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
                              text: "Reset Password",
                              style: headText(
                                  color: AppColors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 280,
                          child:
                              SvgPicture.asset("assets/images/svgs/reset.svg")),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: CommonText(
                          text: "Change or set your new password",
                          style: regularText(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Form(
                          // key: AuthController.to.updatePasswordKey,
                          child: Column(
                        children: [
                          CommonTextFormField(
                              hintText: "New password",
                              obscureText: true,
                              // prefixIcon: Icons.lock,
                              controller: AuthController.to.uPassword,
                              validator: (data) {
                                if (data!.isEmpty || data == "") {
                                  return "Password field required";
                                } else if (data.length < 6) {
                                  return "Password atleast 6 character";
                                }
                                return null;
                              }),
                          CommonTextFormField(
                              hintText: "Confirm new password",
                              obscureText: true,
                              // prefixIcon: Icons.lock,
                              controller: AuthController.to.cuPassword,
                              validator: (data) {
                                if (data!.isEmpty || data == "") {
                                  return "Confirm Password field required";
                                } else if (data.length < 6) {
                                  return "Confirm Password atleast 6 character";
                                } else if (data !=
                                    AuthController.to.uPassword.text) {
                                  return "Password mismatch";
                                }
                                return null;
                              }),
                        ],
                      )),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: CommonButton(
                            text: "Reset",
                            onTap: () {
                              // if (AuthController.to.updatePasswordKey.currentState!
                              //     .validate()) {
                              //   AuthController.to.updatePassword();
                              // }
                            }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: "Don't change?",
                            style: regularText(),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                              onTap: () {
                                Get.off(() => const Login());
                              },
                              child: CommonText(
                                text: "Login",
                                style: mediumText(color: AppColors.primary),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  // Obx(() => AuthController.to.updatePasswordLoading == true
                  //     ? Container(
                  //     height: media.height,
                  //     width: media.width,
                  //     color: AppColors.black.withOpacity(.6),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const CommonNormalLoading(),
                  //         SizedBox(
                  //           height: media.height * 0.02,
                  //         ),
                  //         const CommonText(
                  //           text: "Password updating...",
                  //           fontColor: AppColors.white,
                  //         )
                  //       ],
                  //     ))
                  //     : const SizedBox())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
