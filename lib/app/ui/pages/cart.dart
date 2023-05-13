import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/cart/cartitem.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:fido/app/ui/widgets/main_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: SizedBox(
                    height: Get.height * 0.27,
                    child: ListView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, int index) {
                        return CartItemCard(
                          productName: "Product Name",
                          productDescription: "Description\nDescription",
                          productImage:
                              "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg",
                          productAmount: 'Rs. 339',
                        );
                      },
                    ),
                  ),
                ),
                MainClipPath(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Get.toNamed('/cart');
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
                    ],
                  ),
                ),
              ],
            ),
            Container(
                width: Get.width,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey.withOpacity(.3),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
                child: Stack(
                  children: [
                    Positioned(
                        right: 15,
                        top: 50,
                        child: CommonText(
                            text: "Change",
                            style: mediumText(
                                color: AppColors.primary, fontSize: 14))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: CommonText(
                              text: "Shipping Address",
                              style: mediumText(fontSize: 18)),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 70,
                              width: 80,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.grey.withOpacity(.3),
                                        spreadRadius: 1,
                                        blurRadius: 1)
                                  ],
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://www.thestatesman.com/wp-content/uploads/2020/04/googl_ED.jpg"))),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                    text: "Deliver to : Home",
                                    style: mediumText(fontSize: 14)),
                                CommonText(
                                    text:
                                        "720, Ram Nagar, Rs Puram\nPincode - 641002",
                                    textAlign: TextAlign.start,
                                    style: regularText(
                                        color: AppColors.grey, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: CommonText(
                              text: "Price Details",
                              style: mediumText(fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, int index) {
                                return Row(
                                  children: [
                                    CommonText(
                                        text: "Pedgiree",
                                        style: regularText(fontSize: 14)),
                                    Spacer(),
                                    CommonText(
                                        text: "Rs 339.00",
                                        style: mediumText(fontSize: 14)),
                                  ],
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              CommonText(
                                  text: "Delivery Fees",
                                  style: regularText(
                                      fontSize: 15, color: AppColors.green)),
                              Spacer(),
                              CommonText(
                                  text: "Free",
                                  style: mediumText(
                                      fontSize: 15, color: AppColors.green)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 1,
                            color: AppColors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              CommonText(
                                  text: "Total",
                                  style: boldText(
                                      fontSize: 15, color: AppColors.green)),
                              Spacer(),
                              CommonText(
                                  text: "Rs 1362.00",
                                  style: boldText(
                                      fontSize: 15, color: AppColors.green)),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: CommonButton(text: "Continue", onTap: () {}))
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
