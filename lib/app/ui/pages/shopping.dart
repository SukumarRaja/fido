import 'dart:math';

import 'package:fido/app/controller/shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../controller/home.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_search.dart';
import '../widgets/common/text.dart';
import '../widgets/main_clip_path.dart';
import '../widgets/shopping/main_menu.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          const Icon(
                            Icons.shopping_cart_sharp,
                            color: AppColors.white,
                            size: 30,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: 13,
                              width: 13,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary),
                              child: CommonText(
                                text: "2",
                                style: mediumText(
                                    color: AppColors.white, fontSize: 11),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: AppColors.white,
                            size: 30,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: 13,
                              width: 13,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary),
                              child: CommonText(
                                text: "2",
                                style: mediumText(
                                    color: AppColors.white, fontSize: 11),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  onPressed: () {
                    // Get.to(() => Filter());
                  },
                  icon: const Icon(
                    Icons.filter_list,
                    color: AppColors.secondary,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: 75,
                margin: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey.withOpacity(.4),
                          spreadRadius: 2,
                          blurRadius: 2)
                    ]),
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return MainMenuCard(
                            name: "Food",
                            icon: Icons.soup_kitchen_outlined,
                            index: index,
                            onTap: () {
                              ShoppingController.to.mainMenuIndex = index;
                            },
                          );
                        })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 90.0, top: 35, right: 10),
                child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.shoppingMenu.withOpacity(.3),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: AppColors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg"))),
                            ),
                            CommonText(text: "Pedigree", style: mediumText())
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
