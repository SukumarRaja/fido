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
      width: Get.width,
      margin:
          const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(.3),
                spreadRadius: 1,
                blurRadius: 1)
          ]),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
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
                        "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg"))),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text: "Pedigree", style: mediumText()),
              CommonText(text: "1 kg", style: mediumText(fontSize: 13)),
              CommonText(text: "Dry Food", style: regularText(fontSize: 12)),
              SizedBox(
                height: 20,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return Icon(
                        Icons.star,
                        size: 14,
                        color: AppColors.primary,
                      );
                    }),
              )
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 1)
                        ]),
                    child: Icon(
                      Icons.remove,
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 8),
                  CommonText(text: "6", style: mediumText()),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 1)
                        ]),
                    child: Icon(
                      Icons.add,
                      size: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CommonText(
                  text: "Rs 236",
                  style: boldText(fontSize: 16, color: AppColors.primary))
            ],
          ),
          SizedBox(width: 15.0)
        ],
      ),
    );
  }
}
