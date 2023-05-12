import 'package:fido/app/ui/widgets/main_clip_path.dart';
import 'package:fido/app/ui/widgets/profile/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/text.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                const MainClipPath(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                        ),
                        CommonText(
                          text: "Notifications",
                          style: boldText(color: AppColors.white, fontSize: 20),
                        ),
                        Spacer(),
                        Container(
                          height: 30,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.filter_list_outlined,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height*0.75,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: 15,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return NotificationTile(
                    notificationTitle: 'Title',
                    notificationDescription:
                        'Your notification will be displayed here',
                    notificationDuration: '2d ago',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
