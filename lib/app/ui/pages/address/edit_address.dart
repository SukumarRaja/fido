import 'package:fido/app/controller/profile.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/common_textform.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:fido/app/ui/widgets/main_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({Key? key}) : super(key: key);

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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                        ),
                        CommonText(
                          text: "Edit Address",
                          style: headText(
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              CommonTextFormField(
                hintText: "Address Line 1",
                controller: ProfileController.to.address1,
              ),
              CommonTextFormField(
                hintText: "Address Line 2",
                controller: ProfileController.to.address2,
              ),
              CommonTextFormField(
                hintText: "City",
                controller: ProfileController.to.city,
              ),
              CommonTextFormField(
                hintText: "State",
                controller: ProfileController.to.state,
              ),
              CommonTextFormField(
                hintText: "Pincode",
                controller: ProfileController.to.pincode,
              ),
              SizedBox(height: 40),
              CommonButton(text: "Save", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
