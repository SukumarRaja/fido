import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/cupertino.dart';

import '../../themes/colors.dart';

class StylistCategoryBox extends StatelessWidget {
  const StylistCategoryBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3,vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
      child: CommonText(text: "Hair care",style: regularText(color: AppColors.grey,fontSize: 12),),
    );
  }
}
