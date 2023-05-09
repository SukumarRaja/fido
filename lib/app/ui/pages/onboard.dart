import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../controller/auth.dart';
import '../themes/colors.dart';
import '../themes/curve/on_board_curve.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);

  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, reason) {},
        height: double.infinity,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      carouselController: controller,
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (i == 1)
                    buildSlide(context,
                        index: 1,
                        image: "pet",
                        title: "Get A Variety Of Choice To Choose !",
                        content:
                            "Lorem Ipsum is simply dummy text of the printing \n and typesetting industry.",
                        buttonText: "Next",
                        skipText: "Skip")
                  else if (i == 2)
                    buildSlide(context,
                        index: 2,
                        image: "pet",
                        title: "Receive High Quality Food Close To You !",
                        content:
                            "Lorem Ipsum is simply dummy text of the printing \n and typesetting industry.",
                        buttonText: "Next",
                        skipText: "Skip")
                  else if (i == 3)
                    buildSlide(
                      context,
                      index: 3,
                      image: "pet",
                      title: "Get A Variety Of Choice To Choose !",
                      content:
                          "Lorem Ipsum is simply dummy text of the printing \n and typesetting industry.",
                      buttonText: "Get Started",
                    )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget buildSlide(
    BuildContext context, {
    required index,
    required image,
    required title,
    required content,
    required buttonText,
    String? skipText,
  }) {
    return Column(
      children: [
        ClipPath(
          clipper: OnBoardCurveImage(),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/$image.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'bold', fontSize: 20),
              ),
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: InkWell(
            onTap: () {
              if (index == 3) {
                AuthController.to.setOnBoardDataAfterScreenCompleted();
              } else {
                controller.nextPage();
              }
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                  )),
              child: Center(
                child: Text(
                  buttonText,
                  style:
                      const TextStyle(fontFamily: 'bold', color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        index == 3
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {
                    AuthController.to.setOnBoardDataAfterScreenCompleted();
                  },
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        skipText!,
                        style: const TextStyle(
                            fontFamily: 'bold', color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
