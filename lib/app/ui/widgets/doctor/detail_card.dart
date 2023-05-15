import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';

class DoctorDetailsCard extends StatelessWidget {
  const DoctorDetailsCard(
      {Key? key, required this.text, required this.colortext})
      : super(key: key);
  final String text;
  final String colortext;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.18),
            spreadRadius: 0,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          CommonText(
            text: text,
            style: regularText(),
          ),
          CommonText(
            text: colortext,
            style: boldText(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
