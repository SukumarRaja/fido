import 'package:fido/app/ui/themes/colors.dart';
import 'package:flutter/material.dart';

class PetDocumentBox extends StatelessWidget {
  const PetDocumentBox({Key? key, required this.onTap}) : super(key: key);
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.add,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
