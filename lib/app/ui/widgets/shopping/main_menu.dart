import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/text.dart';

class MainMenuCard extends StatelessWidget {
  const MainMenuCard(
      {Key? key,
      required this.index,
      required this.icon,
      required this.name,
      required this.onTap,
      required this.controllerIndex})
      : super(key: key);
  final int index;
  final IconData icon;
  final String name;
  final Function() onTap;
  final int controllerIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: controllerIndex == index
                    ? AppColors.shoppingMenuSelected
                    : AppColors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: controllerIndex == index
                        ? Colors.transparent
                        : AppColors.shoppingMenu)),
            child: Icon(
              icon,
              color: controllerIndex == index
                  ? AppColors.white
                  : AppColors.shoppingMenu,
              size: 30,
            ),
          ),
          CommonText(
              text: name, style: regularText(color: AppColors.shoppingMenu))
        ],
      ),
    );
  }
}
