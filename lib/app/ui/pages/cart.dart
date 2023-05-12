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
    var media = MediaQuery.of(context).size;
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
                        horizontal: 20, vertical: 30.0),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                        ),
                        CommonText(
                          text: "My Cart",
                          style: boldText(color: AppColors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: Get.height * 0.3,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
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
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(12),
                height: Get.height * 0.48,
                width: Get.width * 0.9,
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
                      text: "Shipping Address",
                      style: boldText(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                "https://i.stack.imgur.com/HILmr.png",
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Deliver to : Home",
                              style: regularText(
                                color: AppColors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.primary,
                                  size: 17,
                                ),
                                CommonText(
                                  text: "720,Ram Nagar,RS Puram",
                                  style: regularText(
                                    fontSize: 13,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        CommonText(
                          text: "Change",
                          style: regularText(
                              color: AppColors.primary, fontSize: 13),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    CommonText(
                      text: "Price Details",
                      style: boldText(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                CommonText(
                                  text: "Pedigree",
                                  style: boldText(
                                    fontSize: 14,
                                  ),
                                ),
                                Spacer(),
                                CommonText(
                                  text: "Rs. 339",
                                  style: regularText(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          );
                        }),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        CommonText(
                          text: "Delivery Fee",
                          style: regularText(
                            color: AppColors.free,
                          ),
                        ),
                        Spacer(),
                        CommonText(
                          text: "Free",
                          style: regularText(
                            color: AppColors.free,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    // SizedBox(height: 20),
                    Divider(
                      height: 50,
                      thickness: 1,
                      color: AppColors.black,
                    ),

                    Row(
                      children: [
                        CommonText(
                          text: "Total",
                          style: boldText(
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        CommonText(
                          text: "Rs. 339",
                          style: boldText(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: CommonButton(
                        text: "Continue to Checkout",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
