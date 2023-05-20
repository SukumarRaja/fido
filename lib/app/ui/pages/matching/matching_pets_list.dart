import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/cart/cartitem.dart';
import '../../widgets/common/common_search.dart';
import '../../widgets/common/text.dart';
import '../../widgets/main_clip_path.dart';
import '../../widgets/matching/pet_card.dart';

class MatchingPetList extends StatelessWidget {
  const MatchingPetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                              text: "Nearest Pets",
                              style: headText(
                                  color: AppColors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 125),
                    child: Row(
                      children: [
                        Flexible(
                            child: CommonSearch(
                          controller: HomeController.to.searchController,
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list,
                            color: AppColors.secondary,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.75,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.9,mainAxisSpacing: 4,crossAxisSpacing: 4),
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, int index) {
                      return MatchingPetCard(
                        location: "Rs Puram",
                        name: "Scottish Fold (Grey)",
                        image:
                            "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg",
                        onTap: () {
                          debugPrint("onTapped");
                          Get.toNamed('/matching_pet_detail');
                        },
                      );
                    },
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
