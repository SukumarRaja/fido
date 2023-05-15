import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/common_search.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:fido/app/ui/widgets/main_clip_path.dart';
import 'package:fido/app/ui/widgets/stylist/stylist_categorybox.dart';
import 'package:fido/app/ui/widgets/stylist/stylist_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home.dart';

class StylistListPage extends StatelessWidget {
  const StylistListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const MainClipPath(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                          CommonText(
                            text: "Stylist",
                            style: headText(
                              color: AppColors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 130,
                ),
                child: CommonSearch(
                  controller: HomeController.to.searchController,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                    width: Get.width * 0.85,
                    child: ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        return StylistCategoryBox();
                      },
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.grey,
                  )
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: Get.height * 0.5,
                child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return StylistTile(
                      stylistImage:
                          'https://thumbs.dreamstime.com/b/shih-tzu-dog-grooming-37276679.jpg',
                      stylistName: 'Christina Fraizer',
                      stylistAddress: '12, Centric Rd,GG Park',
                      stylistRating: '5.0',
                      stylistDistance: '2 KM',
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
