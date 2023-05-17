import 'package:fido/app/controller/auth.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/common_textform.dart';
import 'package:fido/app/ui/widgets/common/loading.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/curve/main_curve.dart';
import '../widgets/intl_phone_field.dart';
import '../widgets/main_clip_path.dart';
import 'password/forgot.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      // This dialog will exit your app on saying yes
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              title: const Center(
                  child: Text(
                'Are you sure?',
                style: TextStyle(fontFamily: 'medium'),
              )),
              content: const Text('Do you want to exit an App'),
              contentTextStyle:
                  TextStyle(fontFamily: 'medium', color: AppColors.grey),
              titleTextStyle: TextStyle(
                  fontFamily: 'medium', color: AppColors.primary, fontSize: 16),
              actions: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: AppColors.grey,
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    'No',
                    style:
                        TextStyle(color: AppColors.white, fontFamily: 'medium'),
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: AppColors.primary,
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )) ??
          false;
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    const MainClipPath(),
                    Obx(() => AuthController.to.isLogin == false
                        ? GestureDetector(
                            onTap: () {
                              AuthController.to.isLogin = true;
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
                                      text: "Register",
                                      style: headText(
                                          color: AppColors.white,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox())
                  ],
                ),
                Obx(() => AuthController.to.isLogin == true
                    ? buildLogin()
                    : buildRegister()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50.0),
        CommonTextFormField(
          hintText: "Enter name",
          controller: AuthController.to.lEmail,
          validator: (data) {
            if (data == null || data.isEmpty || data == "") {
              return "Please enter name";
            }
            return null;
          },
        ),
        CommonTextFormField(
          hintText: "Enter email",
          controller: AuthController.to.lPassword,
          validator: (data) {
            if (data == null || data.isEmpty || data == "") {
              return "Please enter email";
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntlPhoneField(
            maxLength: 10,
            hintText: "Phone",
            controller: AuthController.to.lPassword,
            initialCountryCode: "IN",
            fontFamily: "medium",
            validator: (data) {
              if (data!.isEmpty || data == "") {
                return "Phone field required";
              } else if (data.length < 10) {
                return "Phone number must be 10 character";
              }
              return null;
            },
          ),
        ),
        CommonTextFormField(
          hintText: "Enter password",
          controller: AuthController.to.lEmail,
          obscureText: true,
          validator: (data) {
            if (data == null || data.isEmpty || data == "") {
              return "Please enter password";
            } else if (data.length < 6) {
              return "Password must be 8 character";
            }
            return null;
          },
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50),
          child: CommonButton(
            text: "Register",
            onTap: () {},
          ),
        ),
        const SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(text: "Already have an account ?", style: regularText()),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                AuthController.to.isLogin = true;
              },
              child: CommonText(
                  text: "Login", style: mediumText(color: AppColors.primary)),
            ),
          ],
        ),
      ],
    );
  }

  Form buildLogin() {
    return Form(
      key: AuthController.to.loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CommonText(
                text: "Login", style: boldText(color: AppColors.primary)),
          ),
          const SizedBox(height: 50.0),
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
          CommonTextFormField(
            hintText: "Enter password",
            obscureText: true,
            controller: AuthController.to.lPassword,
            validator: (data) {
              if (data == null || data.isEmpty || data == "") {
                return "Please enter password";
              }
              // } else if (data.length < 6) {
              //   return "Password must be 8 character";
              // }
              return null;
            },
          ),
          Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/forgot');
                  },
                  child: CommonText(
                      text: "Forgot Password ?", style: regularText()))),
          Obx(
            () => AuthController.to.loginLoading == true
                ? const Center(
                    child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: SimpleLoading(),
                  ))
                : Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 50),
                    child: CommonButton(
                      text: "Login",
                      onTap: () {
                        if (AuthController.to.loginKey.currentState!
                            .validate()) {
                          AuthController.to.login();
                        }
                      },
                    ),
                  ),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(text: "Don't have an account ?", style: regularText()),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  AuthController.to.isLogin = false;
                },
                child: CommonText(
                    text: "Register",
                    style: mediumText(color: AppColors.primary)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
