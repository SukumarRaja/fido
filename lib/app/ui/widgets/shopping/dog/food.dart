import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';

class DogFoodCard extends StatelessWidget {
  const DogFoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(20),
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
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.white,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://www.puprise.com/wp-content/uploads/2020/07/Royal-Canin-Mini-Adult-Wet-Dog-Food-Pouch.jpg")),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey.withOpacity(.2),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                        text: "Royal Canin", style: boldText(fontSize: 14)),
                    CommonText(
                        text: "Starter for",
                        style:
                            regularText(fontSize: 11, color: AppColors.grey)),
                    CommonText(
                        text: "Mother & BabyDog",
                        style:
                            regularText(fontSize: 11, color: AppColors.grey)),
                    Row(
                      children: [
                        CommonText(
                            text: "Rs.", style: regularText(fontSize: 13)),
                        CommonText(
                            text: "1100",
                            style:
                                regularText(fontSize: 13, lineThrough: true)),
                        SizedBox(
                          width: 5,
                        ),
                        CommonText(
                            text: "Rs. 1530", style: boldText(fontSize: 14)),
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
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.secondary],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                  color: AppColors.primary),
              child: const Icon(
                Icons.add,
                size: 18,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
