import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:fido/app/ui/widgets/stylist/service_tile.dart';
import 'package:flutter/material.dart';

class StylistServices extends StatelessWidget {
  const StylistServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         ServiceTile(servicetext: 'Brushing'),
         ServiceTile(servicetext: 'Body wash & Grooming'),
         ServiceTile(servicetext: 'Hair Cut'),
         ServiceTile(servicetext: 'Anti-Dandruff treatment'),
         ServiceTile(servicetext: 'Nail Trim'),
         ServiceTile(servicetext: 'Massage'),
         ServiceTile(servicetext: 'Ear & Eye Clean'),
         ServiceTile(servicetext: 'Teeth Brush'),
         ServiceTile(servicetext: 'Flea and Tick treatment'),

        ],
      ),
    );
  }
}
