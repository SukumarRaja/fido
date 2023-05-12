import 'package:fido/app/ui/pages/pets/my_pets.dart';
import 'package:fido/app/ui/pages/profile/notification.dart';
import 'package:fido/app/ui/widgets/profile/profilemenu_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/text.dart';
import '../../widgets/main_clip_path.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
                      horizontal: 15, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => NotificationPage());
                        },
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.white,
                          size: 28,
                        ),
                      ),
                      Spacer(),
                      CommonText(
                        text: "User",
                        style: boldText(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                "https://resize.indiatvnews.com/en/resize/newbucket/730_-/2023/01/PTI01_10_2023_000229B.jpg",
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: Get.width * 0.9,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.18),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt_long_outlined,
                          color: AppColors.white,
                          size: 28,
                        ),
                      ),
                      CommonText(
                        text: "My Orders",
                        style: regularText(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.local_offer_outlined,
                          color: AppColors.white,
                          size: 28,
                        ),
                      ),
                      CommonText(
                        text: "Offers & Promos",
                        style: regularText(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.white,
                          size: 28,
                        ),
                      ),
                      CommonText(
                        text: "Delivery\nAddress",
                        style: regularText(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.9,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.18),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "My Account",
                    style: boldText(fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  ProfileMenuTile(
                    icon: Icons.pets_outlined,
                    text: "My Pets",
                    onTap: () {
                      Get.to(()=>MyPets());
                    },
                  ),
                  SizedBox(height: 5),
                  ProfileMenuTile(
                    icon: Icons.credit_card_outlined,
                    text: "Payment",
                    onTap: () {},
                  ),
                  SizedBox(height: 5),
                  ProfileMenuTile(
                    icon: Icons.location_on_outlined,
                    text: "My Address",
                    onTap: () {},
                  ),
                  SizedBox(height: 15),
                  CommonText(
                    text: "More",
                    style: boldText(fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  ProfileMenuTile(
                    icon: Icons.dark_mode_outlined,
                    text: "My Address",
                    isIconWidget: true,
                    widget: Switch(
                      value: false,
                      onChanged: (bool value) {},
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 5),
                  ProfileMenuTile(
                    endIconColor: AppColors.white,
                    icon: Icons.logout,
                    text: "Logout",
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}