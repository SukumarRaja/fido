import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/profile.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/text.dart';

class TypeofAddressCard extends StatelessWidget {
  const TypeofAddressCard(
      {Key? key,
      required this.index,
      required this.name,
      required this.icon,
      required this.onTap})
      : super(key: key);
  final int index;
  final String name;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 35,
          padding: const EdgeInsets.only(right: 15, left: 10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: AppColors.white,
              border: Border.all(
                  color: ProfileController.to.typeofAddressIndex == index
                      ? AppColors.shoppingMenuSelected
                      : AppColors.black.withOpacity(.5))),
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              CommonText(
                  text: name,
                  style: regularText(
                      fontSize: 14,
                      color: ProfileController.to.typeofAddressIndex == index
                          ? AppColors.shoppingMenuSelected
                          : AppColors.black.withOpacity(.5)))
            ],
          ),
        ),
      ),
    );
  }
}
