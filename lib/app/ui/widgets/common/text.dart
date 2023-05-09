import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText({Key? key, required this.text, required this.style})
      : super(key: key);
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: style,
    );
  }
}
