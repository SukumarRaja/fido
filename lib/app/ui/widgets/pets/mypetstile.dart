import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';

class MyPetsTile extends StatelessWidget {
  const MyPetsTile({
    Key? key,
    required this.petImage,
    required this.petName,
    required this.petGender,
    required this.petBreed,
    required this.petAge,
  }) : super(key: key);
  final String petImage;
  final String petName;
  final String petGender;
  final String petBreed;
  final String petAge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(5),
      width: Get.width * 0.8,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey,
                  spreadRadius: 1.5,
                  blurRadius: 1,
                )
              ],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(petImage),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: petName,
                style: boldText(fontSize: 18),
              ),
              CommonText(
                text: petGender,
                style: regularText(fontSize: 10),
              ),
              CommonText(
                text: petBreed,
                style: regularText(fontSize: 10),
              ),
            ],
          ),
          CommonText(
            text: petAge,
            style: regularText(fontSize: 12),
          ),
          Icon(
            Icons.edit,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
