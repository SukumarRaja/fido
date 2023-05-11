import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(
      {Key? key,
      required this.productName,
      required this.productDescription,
      required this.productImage,
      required this.productAmount})
      : super(key: key);

  final String productName;
  final String productDescription;
  final String productImage;
  final String productAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: Get.height * 0.15,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFF6F6F6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("$productImage"),
              ),
            ),
          ),
          // SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: productName,
                  style: boldText(fontSize: 16, color: AppColors.black),
                ),
                CommonText(
                  text: productDescription,
                  style: regularText(fontSize: 12),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.2,
                  height: Get.height * 0.02,
                  decoration: BoxDecoration(
                      color: AppColors.cartIncrementBox,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.remove,
                        color: AppColors.white,
                        size: 10,
                      ),
                      CommonText(
                        text: "1",
                        style: regularText(
                          color: AppColors.white,
                          fontSize: 10,
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(),
                CommonText(
                    text: productAmount,
                    style: regularText(color: AppColors.primary))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
