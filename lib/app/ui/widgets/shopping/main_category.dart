import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/text.dart';

class MainCategoryCard extends StatelessWidget {
  const MainCategoryCard(
      {Key? key, required this.name, required this.image, required this.onTap})
      : super(key: key);
  final String name;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.shoppingMenu.withOpacity(.3),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.white,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(image),
                ),
              ),
            ),
            CommonText(text: name, style: mediumText())
          ],
        ),
      ),
    );
  }
}
