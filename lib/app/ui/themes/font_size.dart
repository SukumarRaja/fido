import 'package:flutter/material.dart';

import 'colors.dart';

headText(
    {Color color = AppColors.black,
    String fontFamily = 'medium',
    double fontSize = 18.0}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
  );
}

regularText() {
  return const TextStyle(fontFamily: 'regular', fontSize: 14);
}

boldText({Color color = AppColors.black}) {
  return TextStyle(fontSize: 24, fontFamily: 'bold', color: color);
}

mediumText({Color color = AppColors.black, double fontSize = 16}) {
  return TextStyle(fontSize: fontSize, fontFamily: 'medium', color: color);
}
