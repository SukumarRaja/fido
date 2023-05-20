import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';

class MatchingPetCard extends StatelessWidget {
  const MatchingPetCard(
      {Key? key,
      required this.location,
      required this.name,
      required this.onTap,
      required this.image})
      : super(key: key);

  final String location;
  final String name;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            margin: const EdgeInsets.only(top: 6.0, left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.secondary,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primary.withOpacity(.3),
                      spreadRadius: 1,
                      blurRadius: 1)
                ]),
          ),
          Container(
              width: Get.width,
              margin: const EdgeInsets.only(
                  top: 4.0, bottom: 6.0, right: 8.0, left: 8.0),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 110,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.white,
                            border: Border.all(
                                color: AppColors.shoppingMenu, width: 2),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey.withOpacity(.3),
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ],
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage(image))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CommonText(text: location, style: regularText()),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CommonText(text: name, style: boldText(fontSize: 16)),
                          Container(
                              margin: const EdgeInsets.only(right: 5, top: 8),
                              height: 30,
                              width: 70,
                              alignment: Alignment.topRight,
                              child: CommonButton(text: "Mating", onTap: () {}))
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: Icon(
                        Icons.favorite_border_sharp,
                        color: AppColors.red,
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
