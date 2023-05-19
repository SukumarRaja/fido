import 'package:fido/app/controller/file.dart';
import 'package:fido/app/controller/pet.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/common_popup.dart';
import 'package:fido/app/ui/widgets/common/common_textform.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:fido/app/ui/widgets/pets/petdocument.dart';
import 'package:fido/app/ui/widgets/pets/petimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPetAdd extends StatelessWidget {
  const InitialPetAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PetController.to.addPetPageIndex = 2;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary,
                AppColors.secondary,
              ],
            ),
          ),
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: PetController.to.addPetPageIndex == 1 ? 20 : 10,
                        width: PetController.to.addPetPageIndex == 1 ? 20 : 10,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          boxShadow: [
                            PetController.to.addPetPageIndex == 1
                                ? BoxShadow(
                                    color: AppColors.secondary,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  )
                                : BoxShadow(),
                          ],
                          color: PetController.to.addPetPageIndex == 1
                              ? AppColors.primary
                              : AppColors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        height: PetController.to.addPetPageIndex == 2 ? 20 : 10,
                        width: PetController.to.addPetPageIndex == 2 ? 20 : 10,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: PetController.to.addPetPageIndex == 2
                              ? AppColors.primary
                              : AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            PetController.to.addPetPageIndex == 2
                                ? BoxShadow(
                                    color: AppColors.secondary,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  )
                                : BoxShadow(),
                          ],
                        ),
                      ),
                      Container(
                        height: PetController.to.addPetPageIndex == 3 ? 20 : 10,
                        width: PetController.to.addPetPageIndex == 3 ? 20 : 10,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: PetController.to.addPetPageIndex == 3
                              ? AppColors.primary
                              : AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            PetController.to.addPetPageIndex == 3
                                ? BoxShadow(
                                    color: AppColors.secondary,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  )
                                : BoxShadow(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  PetController.to.addPetPageIndex == 1
                      ? petDetails(context)
                      : PetController.to.addPetPageIndex == 2
                          ? petImage(context)
                          : petCertificates(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column petCertificates(BuildContext context) {
    return Column(
      children: [
        CommonText(
          text: "Certificates & Documents",
          style: boldText(
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 10),
        CommonText(
          text: "Upload Files",
          style: mediumText(color: AppColors.white, fontSize: 20),
        ),
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 400,
            width: Get.width,
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, int index) {
                return PetDocumentBox(
                  onTap: () {},
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          child: CommonButton(
              text: "Next",
              onTap: () {
                PetController.to.addPetPageIndex = 1;
              }),
        ),
      ],
    );
  }

  Column petImage(BuildContext context) {
    return Column(
      children: [
        CommonText(
          text: "Pet Images",
          style: boldText(
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 60),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 400,
            width: Get.width,
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, int index) {
                return PetImageBox(
                  onTap: () {
                    if (index == 0) {
                      FileUploadController.to
                          .showSelectionDialogPet1and2(oneOrTwo: true);
                    } else if (index == 1) {
                      FileUploadController.to
                          .showSelectionDialogPet1and2(oneOrTwo: false);
                    } else if (index == 2) {
                      FileUploadController.to
                          .showSelectionDialogPet3and4(threeOrfour: true);
                    } else {
                      FileUploadController.to
                          .showSelectionDialogPet3and4(threeOrfour: false);
                    }
                  },
                  index: index,
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 80.0),
          child: CommonButton(
              text: "Next",
              onTap: () {
                PetController.to.addPetPageIndex = 3;
              }),
        ),
      ],
    );
  }

  Column petDetails(BuildContext context) {
    return Column(
      children: [
        CommonText(
          text: "Pet Details",
          style: boldText(
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 30),
        petTypeField(context),
        SizedBox(height: 15),
        CommonTextFormField(
            hintText: "Pet Name", controller: PetController.to.petName),
        CommonTextFormField(
            hintText: "Sex", controller: PetController.to.petName),
        CommonTextFormField(
            hintText: "Age", controller: PetController.to.petName),
        CommonTextFormField(
            hintText: "Breed", controller: PetController.to.petName),
        SizedBox(height: 10),
        vaccinatedField(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 100.0),
          child: CommonButton(
              text: "Next",
              onTap: () {
                PetController.to.addPetPageIndex = 2;
              }),
        ),
      ],
    );
  }

  GestureDetector petTypeField(BuildContext context) {
    return GestureDetector(
      onTap: () {
        petPopupMenu(context);
      },
      child: Container(
        height: Get.height * 0.06,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(.3),
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
            child: CommonText(
          text: "${PetController.to.petTypeName}",
          style: boldText(fontSize: 16),
        )),
      ),
    );
  }

  GestureDetector vaccinatedField() {
    return GestureDetector(
      onTap: () {
        PetController.to.isVaccination == 0
            ? PetController.to.isVaccination = 1
            : PetController.to.isVaccination = 0;
      },
      child: Container(
        padding: EdgeInsets.all(12),
        height: Get.height * 0.06,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(.3),
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonText(
                text: "Vaccinated?",
                style: regularText(fontSize: 14, color: AppColors.hintext),
              ),
              Spacer(),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: PetController.to.isVaccination == 1
                      ? AppColors.primary
                      : AppColors.white,
                  border: Border.all(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
