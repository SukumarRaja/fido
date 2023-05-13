import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/text.dart';
import '../../widgets/main_clip_path.dart';

class Addresses extends StatelessWidget {
  const Addresses({Key? key}) : super(key: key);

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
                              text: "Addresses",
                              style: headText(
                                  color: AppColors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  )
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
                                bottom: 15,
                                child: Icon(
                                  Icons.delete,
                                  color: AppColors.red,
                                )),
                            Positioned(
                                right: 10,
                                top: 15,
                                child: Icon(
                                  Icons.edit,
                                  color: AppColors.shoppingMenu,
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                      text: "Home",
                                      style: mediumText(color: AppColors.grey)),
                                  CommonText(
                                      text: "Friend Name",
                                      style: regularText(fontSize: 14)),
                                  CommonText(
                                      text:
                                          "720, Ram Nagar, Rs Puram, Coimbatore\nPincode - 641022",
                                      textAlign: TextAlign.start,
                                      style: regularText(fontSize: 14)),
                                  CommonText(
                                      text: "+91 9863426746",
                                      style: regularText(fontSize: 14)),
                                ],
                              ),
                            ),
                          ],
                        ));
                  }),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.grey.withOpacity(.2),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.shoppingMenu.withOpacity(.3),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.my_location_outlined,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CommonText(text: "Use Current Location", style: regularText())
                ]),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  child: CommonButton(text: "Add Another", onTap: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
