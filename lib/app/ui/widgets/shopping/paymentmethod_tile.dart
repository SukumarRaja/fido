import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({Key? key, required this.paymentMethodText, required this.onTap, required this.index})
      : super(key: key);
  final String paymentMethodText;
  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width*0.9,
        padding: EdgeInsets.all(15),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: CommonText(
          textAlign: TextAlign.start  ,
          text: paymentMethodText,
          style: regularText(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
