import 'package:fido/app/controller/shopping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/text.dart';

class MainMenuCard extends StatelessWidget {
  const MainMenuCard(
      {Key? key,
      required this.index,
      required this.icon,
      required this.name,
      required this.onTap})
      : super(key: key);
  final int index;
  final IconData icon;
  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                height: 55,
                width: 55,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: ShoppingController.to.mainMenuIndex == index
                        ? AppColors.shoppingMenuSelected
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: ShoppingController.to.mainMenuIndex == index
                            ? Colors.transparent
                            : AppColors.shoppingMenu)),
                child: Icon(
                  icon,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
              CommonText(
                  text: name, style: regularText(color: AppColors.shoppingMenu))
            ],
          ),
        ));
  }
}
