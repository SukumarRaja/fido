import 'package:flutter/material.dart';
import '../themes/colors.dart';
import '../themes/curve/main_curve.dart';

class MainClipPath extends StatelessWidget {
  const MainClipPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MainCurve(),
      child: Container(
        height: 140,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.secondary]),
        ),
      ),
    );
  }
}
