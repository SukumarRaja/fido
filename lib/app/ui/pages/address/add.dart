import 'package:fido/app/controller/home.dart';
import 'package:fido/app/ui/pages/home/home.dart';
import 'package:fido/app/ui/widgets/common/loading.dart';
import 'package:fido/app/ui/widgets/common/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/profile.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/address/type_of_address.dart';
import '../../widgets/common/button.dart';
import '../../widgets/common/common_textform.dart';
import '../../widgets/common/text.dart';
import '../../widgets/main_clip_path.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ProfileController.to.clearAddAddressFields();
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                        ),
                        CommonText(
                          text: "Add Address",
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
              Form(
                key: ProfileController.to.addAddressFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CommonTextFormField(
                            hintText: "Pincode",
                            controller: ProfileController.to.addPincode,
                            keyboardType: TextInputType.number,
                            validator: (data) {
                              if (data!.isEmpty || data == "") {
                                return "Please enter address pincode";
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              HomeController.to
                                  .getCurrentAddress(isAddAddress: true);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.secondary,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.shoppingMenu
                                            .withOpacity(.3),
                                        blurRadius: 1,
                                        spreadRadius: 1)
                                  ]),
                              child: Obx(() => HomeController
                                          .to.getCurrentAddressLoading ==
                                      true
                                  ? const SimpleLoading(color: AppColors.white)
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                          const Icon(
                                            Icons.my_location_outlined,
                                            color: AppColors.white,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CommonText(
                                              text: "Use Current Location",
                                              style: regularText(
                                                  color: AppColors.white))
                                        ])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CommonTextFormField(
                      hintText: "Phone",
                      controller: ProfileController.to.addPhone,
                      keyboardType: TextInputType.phone,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Please enter phone";
                        }
                        return null;
                      },
                    ),
                    CommonTextFormField(
                      hintText: "Name",
                      controller: ProfileController.to.addName,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Please enter address name";
                        }
                        return null;
                      },
                    ),
                    CommonTextFormField(
                      hintText: "Address Line 1",
                      controller: ProfileController.to.addAddress1,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Please enter address line1";
                        }
                        return null;
                      },
                    ),
                    CommonTextFormField(
                      hintText: "Address Line 2 (optional)",
                      controller: ProfileController.to.addAddress2,
                      // validator: (data) {
                      //   if (data!.isEmpty || data == "") {
                      //     return "Please enter address line2";
                      //   }
                      //   return null;
                      // },
                    ),
                    CommonTextFormField(
                      hintText: "City",
                      controller: ProfileController.to.addCity,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Please enter address city";
                        }
                        return null;
                      },
                    ),
                    CommonTextFormField(
                      hintText: "State",
                      controller: ProfileController.to.addState,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Please enter address state";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CommonText(
                          text: "Type of Address",
                          style:
                              mediumText(fontSize: 14, color: AppColors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Row(
                        children: [
                          TypeofAddressCard(
                            name: "Home",
                            index: 0,
                            icon: Icons.home,
                            onTap: () {
                              ProfileController.to.typeofAddressIndex = 0;
                              ProfileController.to.typeofAddress = "Home";
                            },
                          ),
                          TypeofAddressCard(
                            name: "Work",
                            index: 1,
                            icon: Icons.apartment,
                            onTap: () {
                              ProfileController.to.typeofAddressIndex = 1;
                              ProfileController.to.typeofAddress = "Work";
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              CommonButton(
                  text: "Save",
                  onTap: () {
                    if (ProfileController.to.addAddressFormKey.currentState!
                        .validate()) {
                      if (ProfileController.to.typeofAddress == "") {
                        commonToast(msg: "Please choose type of address");
                      } else {
                        debugPrint("api hit for add address");
                      }
                    }
                  }),
              const SizedBox(height: 15),

            ],
          ),
        ),
      ),
    );
  }
}
