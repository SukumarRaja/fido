import 'package:fido/app/controller/stylist.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/stylist/details.dart';
import 'package:fido/app/ui/widgets/stylist/review.dart';
import 'package:fido/app/ui/widgets/stylist/services.dart';
import 'package:fido/app/ui/widgets/stylist/stylist_selectcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/text.dart';

class StylistProfile extends StatelessWidget {
  const StylistProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primary,
                      ),
                      CommonText(
                        text: "Stylist Name",
                        style: headText(
                          fontSize: 20,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              stylistImage(),
              BookAVisitCard(),
              stylistDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Container stylistDescription() {
    return Container(
      height: Get.height * 0.4,
      width: Get.width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.18),
            spreadRadius: 0,
            blurRadius: 5,
          )
        ],
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                StylistSelectCard(
                  selectTitle: 'Details',
                  onTap: () {
                    StylistController.to.selectIndex = 0;
                  },
                  index: 0,
                ),
                StylistSelectCard(
                  selectTitle: 'Services',
                  onTap: () {
                    StylistController.to.selectIndex = 1;
                  },
                  index: 1,
                ),
                StylistSelectCard(
                  selectTitle: 'Reviews',
                  onTap: () {
                    StylistController.to.selectIndex = 2;
                  },
                  index: 2,
                ),
              ],
            ),
            Container(
              height: Get.height * 0.3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StylistController.to.selectIndex == 0
                        ? StylistDetail()
                        : StylistController.to.selectIndex == 1
                            ? StylistServices()
                            : StylistReview(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container BookAVisitCard() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.18),
            spreadRadius: 0,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Christina Fraizer",
                style: mediumText(),
              ),
              CommonText(
                text: "12, Centric Rd,GG Park",
                style: regularText(fontSize: 10),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.grey,
                    size: 15,
                  ),
                  CommonText(
                    text: "2 KM",
                    style: regularText(fontSize: 12, color: AppColors.grey),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      Icons.phone,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      Icons.chat_outlined,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                  height: 30,
                  width: 150,
                  child: CommonButton(text: "Book a Visit", onTap: () {})),
            ],
          )
        ],
      ),
    );
  }

  Container stylistImage() {
    return Container(
      margin: EdgeInsets.all(20),
      height: Get.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://thumbs.dreamstime.com/b/shih-tzu-dog-grooming-37276679.jpg"),
          )),
    );
  }
}
