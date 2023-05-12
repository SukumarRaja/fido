import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/text.dart';
import '../widgets/main_clip_path.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

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
                            size: 16,
                          ),
                          CommonText(
                              text: "WishList",
                              style: headText(
                                  color: AppColors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: Get.width,
                height: Get.height*0.79,
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 2,
                      // mainAxisSpacing: 2,
                      childAspectRatio: 0.9),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(6.0),
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey.withOpacity(.3),
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                AppColors.grey.withOpacity(.3),
                                            spreadRadius: 1,
                                            blurRadius: 1)
                                      ],
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              "https://www.puprise.com/wp-content/uploads/2020/07/Royal-Canin-Mini-Adult-Wet-Dog-Food-Pouch.jpg"))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                          text: "Pedigree",
                                          style: boldText(fontSize: 18)),
                                      Row(
                                        children: [
                                          CommonText(
                                              text: "Rs.",
                                              style: regularText(fontSize: 13)),
                                          CommonText(
                                              text: "1100",
                                              style: regularText(
                                                  fontSize: 13,
                                                  lineThrough: true)),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CommonText(
                                              text: "Rs. 1530",
                                              style: boldText(fontSize: 14)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    child: CommonButton(
                                        text: "Move to Cart", onTap: () {}))
                              ],
                            ),
                            Positioned(
                                right: 5,
                                top: 5,
                                child: Icon(
                                  Icons.favorite,
                                  color: AppColors.red,
                                ))
                          ],
                        ));
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
