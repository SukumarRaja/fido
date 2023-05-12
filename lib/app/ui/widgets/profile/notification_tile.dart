import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key, required this.notificationTitle, required this.notificationDescription, required this.notificationDuration}) : super(key: key);
  final String notificationTitle;
  final String notificationDescription;
  final String notificationDuration;

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
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.18),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Icon(
              Icons.notifications_none_outlined,
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: notificationTitle,
                style: mediumText(fontSize: 14),
              ),
              CommonText(
                text: notificationDescription,
                style: regularText(fontSize: 10),
              ),
            ],
          ),
          Spacer(),
          CommonText(
            text: notificationDuration,
            style: regularText(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
