import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import 'home/main.dart';
import 'login.dart';
import 'onboard.dart';

class Initial extends StatefulWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  String? isLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: AuthController(),
          initState: (_) async {
            AuthController.to.checkIsUpdateAvailable();
            bool login = await AuthController.to.loginCheck();
            debugPrint("is Login is: $login");
            bool onBoarding = await AuthController.to.checkOnBoarding();
            debugPrint("onBoarding: $onBoarding");
            if (onBoarding == true) {
              setState(() {
                isLogin = "onBoarding";
              });
            } else if (login == true) {
              setState(() {
                isLogin = "login";
              });
            } else {
              debugPrint("logged in $isLogin");
            }
          },
          builder: (_) => isLogin == "onBoarding"
              ? OnBoarding()
              : isLogin == "login"
                  ? HomeMain()
                  : const Login()),
    );
  }
}
