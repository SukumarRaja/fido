import 'package:flutter/material.dart';
import '../../../controller/home.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/button.dart';
import '../common/text.dart';
import 'package:permission_handler/permission_handler.dart' as perm;

class LocationAllowCard extends StatelessWidget {
  const LocationAllowCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(media.width * 0.05),
      width: media.width * 0.6,
      // height: media.width * 0.3,
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          CommonText(text: "Please Allow Location", style: mediumText()),
          const SizedBox(
            height: 10,
          ),
          CommonButton(
            text: "Ok",
            onTap: () async {
              await [perm.Permission.location, perm.Permission.locationAlways]
                  .request();
              HomeController.to.getPermissionAndCurrentLocation();
            },
          ),
        ],
      ),
    );
  }
}
