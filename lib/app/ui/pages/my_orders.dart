import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common/button.dart';
import '../widgets/common/text.dart';
import '../widgets/main_clip_path.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const MainClipPath(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: AppColors.white,
                            size: 16,
                          ),
                          CommonText(
                              text: "My Orders",
                              style: headText(
                                  color: AppColors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 50,
                    child: Row(
                      children: [
                        CommonText(
                            text: "Total Orders : ",
                            style:
                                headText(color: AppColors.white, fontSize: 16)),
                        CommonText(
                            text: "25",
                            style:
                                headText(color: AppColors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey.withOpacity(.3),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        child: Stack(
                          children: [
                            Positioned(
                                right: 10,
                                top: 10,
                                child: Icon(
                                  Icons.delete,
                                  color: AppColors.red,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                          text: "Order 456457876548943146416",
                                          style: boldText(fontSize: 16)),
                                      CommonText(
                                          text:
                                              "Placed on 12 Sep 2022 05:27 pm",
                                          style: regularText(
                                              fontSize: 12,
                                              color: AppColors.grey)),
                                      CommonText(
                                          text:
                                              "Delivered on 17 Sep 2022 11:27 pm",
                                          style: regularText(
                                              fontSize: 12,
                                              color: AppColors.grey)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 90,
                                      margin: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: AppColors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.grey
                                                    .withOpacity(.3),
                                                spreadRadius: 1,
                                                blurRadius: 1)
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  "https://thumbs.dreamstime.com/b/dog-food-pet-animal-bowl-metal-dishware-plate-62553416.jpg"))),
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                            text: "Pedigree",
                                            style: mediumText(fontSize: 14)),
                                        CommonText(
                                            text: "For Adult Dogs",
                                            style: mediumText(
                                                fontSize: 12,
                                                color: AppColors.grey)),
                                        SizedBox(
                                          height: 20,
                                          child: ListView.builder(
                                              itemCount: 5,
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (context, int index) {
                                                return Icon(
                                                  Icons.star,
                                                  size: 14,
                                                  color: AppColors.green,
                                                );
                                              }),
                                        ),
                                        CommonText(
                                            text: "Rs 399",
                                            style: mediumText(
                                                fontSize: 16,
                                                color: AppColors.primary)),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        SizedBox(
                                            height: 35,
                                            child: CommonButton(
                                                text: "Delivered",
                                                onTap: () {})),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        CommonText(
                                            text: "1 Item",
                                            style: regularText()),
                                        Row(
                                          children: [
                                            CommonText(
                                                text: "Total : ",
                                                style: regularText()),
                                            CommonText(
                                                text: "Rs 399",
                                                style: boldText(
                                                    color: AppColors.primary,
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
