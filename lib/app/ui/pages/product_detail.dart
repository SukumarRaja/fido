import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/text.dart';
import '../widgets/main_clip_path.dart';
import '../widgets/shopping/dog/food.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

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
                              text: "Dry Food",
                              style: headText(
                                  color: AppColors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CommonText(
                        text: "Royal Canin",
                        style:
                            boldText(fontSize: 20, color: AppColors.primary)),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite_border_sharp,
                    color: AppColors.red,
                  ),
                  SizedBox(
                    width: 15.0,
                  )
                ],
              ),
              Center(
                child: Container(
                  height: 180,
                  margin: const EdgeInsets.all(10.0),
                  width: Get.width / 1.4,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grey.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 1)
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://therapypet.org/wp-content/uploads/2019/01/SportMix-Dog-Food.jpg"))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primary),
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.grey),
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.grey),
                  ),
                ],
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey.withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                        text: "Royal Canin Mini Starter Dry Food",
                        style: boldText(fontSize: 16)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.primary,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grey.withOpacity(.3),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ]),
                          child: CommonText(
                            text: "Description",
                            style: mediumText(color: AppColors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grey.withOpacity(.3),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ]),
                          child: CommonText(
                            text: "Description",
                            style: mediumText(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grey.withOpacity(.3),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ]),
                          child: CommonText(
                            text: "Description",
                            style: mediumText(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CommonText(
                        textAlign: TextAlign.start,
                        text:
                            "food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion",
                        style: regularText()),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.only(
                                  right: 10, left: 10, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.grey.withOpacity(.3),
                                        spreadRadius: 1,
                                        blurRadius: 1)
                                  ]),
                              child: CommonText(
                                text: "1 kg",
                                style: regularText(),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:
                    CommonText(text: "Releated Products", style: mediumText()),
              ),
              Container(
                height: 200,
                margin: EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/product_detail');
                        },
                        child: Container(
                          width: 150,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grey.withOpacity(.2),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ]),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 110,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: AppColors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://www.puprise.com/wp-content/uploads/2020/07/Royal-Canin-Mini-Adult-Wet-Dog-Food-Pouch.jpg")),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.grey
                                                  .withOpacity(.2),
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                            text: "Royal Canin",
                                            style: boldText(fontSize: 14)),
                                        CommonText(
                                            text: "Starter for",
                                            style: regularText(
                                                fontSize: 11,
                                                color: AppColors.grey)),
                                        CommonText(
                                            text: "Mother & BabyDog",
                                            style: regularText(
                                                fontSize: 11,
                                                color: AppColors.grey)),
                                        Row(
                                          children: [
                                            CommonText(
                                                text: "Rs.",
                                                style:
                                                    regularText(fontSize: 13)),
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
                                  )
                                ],
                              ),
                              Positioned(
                                  right: 3,
                                  top: 5,
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: AppColors.red,
                                  )),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        bottomNavigationBar:  Container(
          margin: EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 10),
              CommonText(
                  text: "Rs 530",
                  style: boldText(
                      fontSize: 20, color: AppColors.primary)),
              Spacer(),
              Row(
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.grey.withOpacity(.6)),
                    child: Icon(
                      Icons.remove,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                  CommonText(
                      text: "2", style: mediumText(fontSize: 18)),
                  Container(
                    height: 28,
                    width: 28,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.primary),
                    child: Icon(
                      Icons.add,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.primary),
                child: Icon(
                  Icons.shopping_cart,
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
