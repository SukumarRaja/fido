import 'package:fido/app/controller/payment.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:fido/app/ui/widgets/main_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/shopping/paymentmethod_tile.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const MainClipPath(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                          CommonText(
                            text: "Payment Method",
                            style: headText(
                              fontSize: 20,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    PaymentMethodTile(
                      paymentMethodText: 'Credit/Debit Card',
                      onTap: () {
                        PaymentController.to.paymentmethodIndex = 0;
                      },
                      index: 0,
                    ),
                    PaymentMethodTile(
                      paymentMethodText: 'Credit/Debit Card',
                      onTap: () {
                        PaymentController.to.paymentmethodIndex = 1;
                      },
                      index: 1,
                    ),
                    PaymentMethodTile(
                      paymentMethodText: 'Credit/Debit Card',
                      onTap: () {
                        PaymentController.to.paymentmethodIndex = 2;
                      },
                      index: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
