import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/text.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.isIconWidget = false,
    this.widget,
    this.endIconColor = AppColors.primary,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Function() onTap;
  final bool isIconWidget;
  final Widget? widget;
  final Color endIconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
          ),
          SizedBox(width: 10),
          CommonText(
            text: text,
            style: regularText(),
          ),
          Spacer(),
          isIconWidget == true
              ? widget!
              : Icon(
                  Icons.arrow_forward_ios,
                  color: endIconColor,
                ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
