import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/colors.dart';

class MatchingPetDetail extends StatelessWidget {
  const MatchingPetDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primary,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: AppColors.white,
                          // size: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Center(
                  child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 180,
                    width: 180,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.secondary),
                  ),
                  Positioned(
                    top: 10,
                    bottom: 10,
                    right: 10,
                    left: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey, width: 2),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"))),
                    ),
                  ),
                ],
              )),
              SizedBox(height: 15),
              Container(
                width: Get.width,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                        text: "Scottish Fold", style: boldText(fontSize: 20)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: AppColors.grey,
                        ),
                        CommonText(
                            text: "Rs Puram (2.5 Miles)",
                            style: mediumText(
                                fontSize: 14, color: AppColors.grey)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grey.withOpacity(.4),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                  text: "4 Months",
                                  style: boldText(fontSize: 14)),
                              CommonText(
                                  text: "Age",
                                  style: mediumText(
                                      fontSize: 12,
                                      color: AppColors.black.withOpacity(.6))),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grey.withOpacity(.4),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                  text: "Grey", style: boldText(fontSize: 14)),
                              CommonText(
                                  text: "Color",
                                  style: mediumText(
                                      fontSize: 12,
                                      color: AppColors.black.withOpacity(.6))),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grey.withOpacity(.4),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                  text: "11 kg", style: boldText(fontSize: 14)),
                              CommonText(
                                  text: "Weight",
                                  style: mediumText(
                                      fontSize: 12,
                                      color: AppColors.black.withOpacity(.6))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    CommonText(
                        text: "Pet Detail", style: boldText(fontSize: 16)),
                    SizedBox(height: 10),
                    CommonText(
                        textAlign: TextAlign.start,
                        text:
                            "40,000+ mischievous, playful and adorable cat photos & pictures. Download your favorite royalty free cat images in HD to 4K quality as wallpapers, backgrounds & more.40,000+ mischievous, playful and adorable cat photos & pictures. Download your favorite royalty free cat images in HD to 4K quality as wallpapers, backgrounds & more.40,000+ mischievous, playful and adorable cat photos & pictures. Download your favorite royalty free cat images in HD to 4K quality as wallpapers, backgrounds & more",
                        style: regularText(fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            border: Border.all(color: AppColors.grey, width: 2),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"))),
                      );
                    }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 90,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey, width: 2),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=1380&t=st=1684578001~exp=1684578601~hmac=10cb8047819aa16c093c72436e8c179ff90859d7a35070a0d7e0a39a42c1cebd"))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(text: "Posted By", style: boldText(fontSize: 12)),
                  CommonText(
                      text: "Nannine Barker",
                      style: regularText(
                          fontSize: 14,
                          color: AppColors.black.withOpacity(.6))),
                ],
              ),
              Spacer(),
              Container(
                  margin: EdgeInsets.only(right: 10.0),
                  height: 40,
                  child: CommonButton(text: "Contact Me", onTap: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
