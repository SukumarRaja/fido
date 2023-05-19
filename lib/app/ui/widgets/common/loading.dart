import 'package:flutter/material.dart';
import '../../themes/colors.dart';

class SimpleLoading extends StatelessWidget {
  const SimpleLoading(
      {Key? key, this.color = AppColors.secondary, this.width, this.height})
      : super(key: key);
  final Color color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? media.width * 0.07,
      width: width ?? media.width * 0.07,
      child: Center(
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
