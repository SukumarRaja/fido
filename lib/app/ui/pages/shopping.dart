import 'package:fido/app/controller/shopping.dart';
import 'package:fido/app/ui/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/common_popup.dart';
import '../widgets/common/common_search.dart';
import '../widgets/common/no-data.dart';
import '../widgets/common/text.dart';
import '../widgets/main_clip_path.dart';
import '../widgets/shopping/dog/food.dart';
import '../widgets/shopping/main_category.dart';
import '../widgets/shopping/main_menu.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const MainClipPath(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/cart');
                      },
                      child: Stack(
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/wish_list');
                      },
                      child: Stack(
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
                      ),
                    )
                  ],
                ),
              ),
              Obx(() => ShoppingController.to.dogFoodCategoriesIndex != 200
                  ? GestureDetector(
                      onTap: () {
                        ShoppingController.to.dogFoodCategoriesIndex = 200;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColors.white,
                              size: 14,
                            ),
                            CommonText(
                                text: ShoppingController
                                            .to.dogFoodCategoriesIndex ==
                                        0
                                    ? "Dry Food"
                                    : ShoppingController
                                                .to.dogFoodCategoriesIndex ==
                                            1
                                        ? "Wed Food"
                                        : ShoppingController.to
                                                    .dogFoodCategoriesIndex ==
                                                2
                                            ? "Treats"
                                            : ShoppingController.to
                                                        .dogFoodCategoriesIndex ==
                                                    3
                                                ? "Supplements"
                                                : "Biscuits",
                                style: boldText(
                                    color: AppColors.white, fontSize: 20))
                          ],
                        ),
                      ),
                    )
                  : const SizedBox()),
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
                    print(
                        "shoppingPopup index ${ShoppingController.to.shoppingPopMenuIndex}");
                    shoppingPopupMenu(context);
                    ShoppingController.to.dogFoodCategoriesIndex = 200;
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
          SizedBox(
            height: Get.height / 1.6,
            child: Stack(
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
                  child: Obx(() => mainMenus()),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 90.0, top: 35, right: 10),
                  child: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Obx(() => mainCategories()),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  mainMenus() {
    if (ShoppingController.to.shoppingPopMenuIndex == 0) {
      return ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return Obx(() => MainMenuCard(
                  name: index == 0 ? "Food" : "Grocery",
                  icon: Icons.soup_kitchen_outlined,
                  index: index,
                  controllerIndex: ShoppingController.to.mainMenuIndexForDog,
                  onTap: () {
                    ShoppingController.to.mainMenuIndexForDog = index;
                    ShoppingController.to.dogFoodCategoriesIndex = 200;
                  },
                ));
          });
    } else if (ShoppingController.to.shoppingPopMenuIndex == 1) {
      return ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return Obx(() => MainMenuCard(
                  name: index == 0 ? "Food" : "Grocery",
                  icon: Icons.soup_kitchen_outlined,
                  index: index,
                  controllerIndex: ShoppingController.to.mainMenuIndexForCat,
                  onTap: () {
                    ShoppingController.to.mainMenuIndexForCat = index;
                  },
                ));
          });
    } else if (ShoppingController.to.shoppingPopMenuIndex == 2) {
      return ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return Obx(() => MainMenuCard(
                  name: index == 0
                      ? "Food &\nCare"
                      : index == 1
                          ? "Accessories"
                          : index == 2
                              ? "Cages & Stand"
                              : "Nest  & Box",
                  icon: Icons.soup_kitchen_outlined,
                  index: index,
                  controllerIndex: ShoppingController.to.mainMenuIndexForBirds,
                  onTap: () {
                    ShoppingController.to.mainMenuIndexForBirds = index;
                  },
                ));
          });
    } else if (ShoppingController.to.shoppingPopMenuIndex == 3) {
      return ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return Obx(() => MainMenuCard(
                  name: index == 0
                      ? "Aquariums Maintenance"
                      : index == 1
                          ? "Decorating Items"
                          : index == 2
                              ? "Food &\nCare"
                              : "Aquariums",
                  icon: Icons.soup_kitchen_outlined,
                  fontSize: 12,
                  index: index,
                  controllerIndex:
                      ShoppingController.to.mainMenuIndexForFishAndAquatics,
                  onTap: () {
                    ShoppingController.to.mainMenuIndexForFishAndAquatics =
                        index;
                  },
                ));
          });
    } else if (ShoppingController.to.shoppingPopMenuIndex == 4) {
      return ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return Obx(() => MainMenuCard(
                  name: index == 0 ? "Food" : "Cages",
                  icon: Icons.soup_kitchen_outlined,
                  index: index,
                  controllerIndex:
                      ShoppingController.to.mainMenuIndexForSmallPets,
                  onTap: () {
                    ShoppingController.to.mainMenuIndexForSmallPets = index;
                  },
                ));
          });
    }
  }

  mainCategories() {
    if (ShoppingController.to.shoppingPopMenuIndex == 0) {
      return mainCategoriesDog();
    } else if (ShoppingController.to.shoppingPopMenuIndex == 1) {
      return mainCategoriesForCat();
    } else if (ShoppingController.to.shoppingPopMenuIndex == 2) {
      return mainCategoriesForBirds();
    } else if (ShoppingController.to.shoppingPopMenuIndex == 3) {
      return mainCategoriesForFishAndAquatics();
    } else if (ShoppingController.to.shoppingPopMenuIndex == 4) {
      return mainCategoriesForSmallPets();
    }
  }

  mainCategoriesDog() {
    if (ShoppingController.to.mainMenuIndexForDog == 0) {
      if (ShoppingController.to.dogFoodCategoriesIndex == 0) {
        return GridView.builder(
          physics: ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 0.7),
          itemCount: 8,
          itemBuilder: (context, index) {
            return DogFoodCard();
          },
        );
      } else if (ShoppingController.to.dogFoodCategoriesIndex == 1) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
          itemCount: 3,
          itemBuilder: (context, index) {
            return MainCategoryCard(
              name: "Wed Food $index",
              image:
                  "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
              onTap: () {},
            );
          },
        );
      } else if (ShoppingController.to.dogFoodCategoriesIndex == 2) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
          itemCount: 3,
          itemBuilder: (context, index) {
            return MainCategoryCard(
              name: "Treats $index",
              image:
                  "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
              onTap: () {},
            );
          },
        );
      } else if (ShoppingController.to.dogFoodCategoriesIndex == 3) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
          itemCount: 3,
          itemBuilder: (context, index) {
            return MainCategoryCard(
              name: "Supplements $index",
              image:
                  "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
              onTap: () {},
            );
          },
        );
      } else if (ShoppingController.to.dogFoodCategoriesIndex == 4) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
          itemCount: 3,
          itemBuilder: (context, index) {
            return MainCategoryCard(
              name: "Biscuits $index",
              image:
                  "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
              onTap: () {},
            );
          },
        );
      } else {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
          itemCount: 5,
          itemBuilder: (context, index) {
            return MainCategoryCard(
              name: index == 0
                  ? "Dry Food"
                  : index == 1
                      ? "Wed Food"
                      : index == 2
                          ? "Treats"
                          : index == 3
                              ? "Supplements"
                              : "Biscuits",
              image:
                  "https://bixbipet.com/wp-content/uploads/Bixbi-Rawbble-Dry-Dog-Food.jpg",
              onTap: () {
                ShoppingController.to.dogFoodCategoriesIndex = index;
              },
            );
          },
        );
      }
    } else if (ShoppingController.to.mainMenuIndexForDog == 1) {
      return const NoData(
        msg: "Sorry No Data",
      );
    } else if (ShoppingController.to.mainMenuIndexForDog == 2) {
      return const NoData(
        msg: "Sorry No Data",
      );
    } else if (ShoppingController.to.mainMenuIndexForDog == 3) {
      return const NoData(
        msg: "Sorry No Data",
      );
    }
  }

  mainCategoriesForCat() {
    if (ShoppingController.to.mainMenuIndexForCat == 0) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemCount: 6,
        itemBuilder: (context, index) {
          return MainCategoryCard(
            name: "Pedigree",
            image:
                "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
            onTap: () {},
          );
        },
      );
    } else if (ShoppingController.to.mainMenuIndexForCat == 1) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemCount: 6,
        itemBuilder: (context, index) {
          return MainCategoryCard(
            name: "Cat",
            image:
                "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
            onTap: () {},
          );
        },
      );
    } else if (ShoppingController.to.mainMenuIndexForCat == 2) {
      return const NoData(
        msg: "Sorry No Data",
      );
    }
  }

  mainCategoriesForBirds() {
    if (ShoppingController.to.mainMenuIndexForBirds == 0) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemCount: 6,
        itemBuilder: (context, index) {
          return MainCategoryCard(
            name: "Birds",
            image:
                "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
            onTap: () {},
          );
        },
      );
    }
  }

  mainCategoriesForFishAndAquatics() {
    if (ShoppingController.to.mainMenuIndexForFishAndAquatics == 0) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemCount: 6,
        itemBuilder: (context, index) {
          return MainCategoryCard(
            name: "Fish & Aquatics",
            image:
                "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
            onTap: () {},
          );
        },
      );
    } else if (ShoppingController.to.mainMenuIndexForFishAndAquatics == 1) {
      return const NoData(
        msg: "Sorry No Data",
      );
    }
  }

  mainCategoriesForSmallPets() {
    if (ShoppingController.to.mainMenuIndexForSmallPets == 0) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemCount: 6,
        itemBuilder: (context, index) {
          return MainCategoryCard(
            name: "Small Pets",
            image:
                "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
            onTap: () {},
          );
        },
      );
    } else if (ShoppingController.to.mainMenuIndexForSmallPets == 1) {
      return const NoData(
        msg: "Sorry No Data",
      );
    }
  }

  dodFoodTitles() {
    if (ShoppingController.to.dogFoodCategoriesIndex == 0) {
      return CommonText(
          text: "< Dry Foods",
          style: boldText(color: AppColors.primary, fontSize: 20));
    } else if (ShoppingController.to.dogFoodCategoriesIndex == 1) {
      return CommonText(
          text: "Wet Foods",
          style: boldText(color: AppColors.primary, fontSize: 20));
    } else if (ShoppingController.to.dogFoodCategoriesIndex == 2) {
      return CommonText(
          text: "Puppy Foods",
          style: boldText(color: AppColors.primary, fontSize: 20));
    }
  }
}
