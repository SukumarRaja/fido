import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/doctor.dart';
import '../../themes/colors.dart';

class AppointmentTimeCard extends StatelessWidget {
  const AppointmentTimeCard(
      {Key? key,
      required this.timetext,
      required this.onTap,
      required this.index})
      : super(key: key);
  final String timetext;
  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: DoctorController.to.timeIndex == index
                ? AppColors.primary
                : AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.18),
                spreadRadius: 0,
                blurRadius: 5,
              ),
            ],
          ),
          child: CommonText(
            text: timetext,
            style: DoctorController.to.timeIndex == index
                ? boldText(
                    fontSize: 14,
                    color: AppColors.white,
                  )
                : regularText(
                    color: AppColors.primary,
                  ),
          ),
        ),
      ),
    );
  }
}
