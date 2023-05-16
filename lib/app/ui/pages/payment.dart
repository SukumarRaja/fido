import 'package:fido/app/controller/payment.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:fido/app/ui/widgets/main_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/common/button.dart';
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
                      paymentMethodText: 'Razorpay  ',
                      onTap: () {
                        PaymentController.to.paymentmethodIndex = 1;
                      },
                      index: 1,
                    ),
                    PaymentMethodTile(
                      paymentMethodText: 'Cash on Delivery',
                      onTap: () {
                        PaymentController.to.paymentmethodIndex = 2;
                      },
                      index: 2,
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.18),
                              blurRadius: 5,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CommonText(
                                text: "Price Details",
                                style: boldText(fontSize: 16)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, int index) {
                                return Row(
                                  children: [
                                    CommonText(
                                        text: "Pedigree",
                                        style: boldText(fontSize: 14)),
                                    Spacer(),
                                    CommonText(
                                        text: "Rs 339.00",
                                        style: mediumText(fontSize: 14)),
                                  ],
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                CommonText(
                                    text: "Delivery Fees",
                                    style: regularText(
                                        fontSize: 15, color: AppColors.green)),
                                Spacer(),
                                CommonText(
                                    text: "Free",
                                    style: mediumText(
                                        fontSize: 15, color: AppColors.green)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(
                              thickness: 1,
                              color: AppColors.black,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                CommonText(
                                  text: "Total",
                                  style: boldText(
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                CommonText(
                                  text: "Rs 1362.00",
                                  style: boldText(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: Get.width * 0.9,
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: CommonButton(
                                  text: "Place Order", onTap: () {}))
                        ],
                      ),
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
