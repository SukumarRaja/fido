import 'package:fido/app/controller/pet.dart';
import 'package:fido/app/controller/profile.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/curve/profile_curve.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/common_popup.dart';
import 'package:fido/app/ui/widgets/common/common_textform.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:fido/app/ui/widgets/profile/profile_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 340,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: ProfileCurveImage(),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.secondary,
                            ],
                          ),
                        ),
                      ),
                    ),
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
                                text: "Edit Profile",
                                style: headText(
                                    color: AppColors.white, fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      right: 0,
                      left: 0,
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/IPLHeadshot2023/2.png"),
                              ),
                            ),
                          ),
                          CommonText(
                            text: "Name",
                            style: boldText(),
                          ),
                          CommonText(
                            text: "Name",
                            style: mediumText(),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 15,
                      top: 15,
                      child: Stack(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://img.freepik.com/premium-photo/cute-golden-retriver-puppy-white-background_104627-3055.jpg?w=2000"))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        "https://tvmdl.tamu.edu/wp-content/uploads/2018/03/AdobeStock_31448871.jpeg",
                                      ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ProfileTextFormField(
                hintText: "Owner Name",
                controller: ProfileController.to.ownerName,
                icon: Icons.edit,
              ),
              ProfileTextFormField(
                hintText: "Email",
                controller: ProfileController.to.email,
                icon: Icons.edit,
              ),
              ProfileTextFormField(
                hintText: "Phone",
                controller: ProfileController.to.phone,
                icon: Icons.edit,
              ),
              ProfileTextFormField(
                hintText: "Location",
                controller: ProfileController.to.location,
                icon: Icons.location_on_outlined,
                isEnabled: false,
                suffixOnTap: () {
                  petPopupMenu(context);
                  print("Enabled");
                },
              ),
              ProfileTextFormField(
                hintText: "Language",
                controller: ProfileController.to.phone,
                icon: Icons.edit,
              ),
              SizedBox(height: 40),
              CommonButton(
                text: "Save",
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
