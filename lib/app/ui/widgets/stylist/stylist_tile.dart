import 'package:fido/app/ui/pages/stylist/stylist_details.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';

class StylistTile extends StatelessWidget {
  const StylistTile(
      {Key? key,
      required this.stylistImage,
      required this.stylistName,
      required this.stylistAddress,
      required this.stylistRating,
      required this.stylistDistance, required this.onTap})
      : super(key: key);
  final String stylistImage;
  final String stylistName;
  final String stylistAddress;
  final String stylistRating;
  final String stylistDistance;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.18),
              spreadRadius: 0,
              blurRadius: 5,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    stylistImage,
                  ),
                ),
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: stylistName,
                  style: mediumText(),
                ),
                CommonText(
                  text: stylistAddress,
                  style: regularText(fontSize: 10),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.grey,
                      size: 15,
                    ),
                    CommonText(
                      text: stylistRating,
                      style: regularText(fontSize: 12, color: AppColors.grey),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.grey,
                      size: 15,
                    ),
                    CommonText(
                      text: stylistDistance,
                      style: regularText(fontSize: 12, color: AppColors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
