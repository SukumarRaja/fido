import 'package:fido/app/ui/themes/colors.dart';
import 'package:flutter/material.dart';

class PetImageBox extends StatelessWidget {
  const PetImageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.add,
        color: AppColors.primary,
      ),
    );
  }
}
