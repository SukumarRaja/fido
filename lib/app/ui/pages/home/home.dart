import 'package:fido/app/controller/home.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/circle_percent_indicator.dart';
import '../../widgets/common/load.dart';
import '../../widgets/common/menu_bar.dart';
import '../../widgets/home/location_allow_card.dart';
import '../../widgets/main_clip_path.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return GetBuilder(
      init: HomeController(),
      initState: (_) {
        HomeController.to.getPermissionAndCurrentLocation();
      },
      builder: (_) {
        var media = MediaQuery.of(context).size;
        return Scaffold(
          drawer: Drawer(),
          body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Stack(
                children: [
                  Obx(() => Container(
                        height: media.height * 1,
                        width: media.width * 1,
                        color: AppColors.white,
                        child: Column(
                          mainAxisAlignment:
                              HomeController.to.locationDenied == true
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.start,
                          children: [
                            HomeController.to.locationDenied == true
                                ? const LocationAllowCard()
                                : HomeController.to.locationDenied == false
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Obx(
                                            () => HomeController.to.isLoading ==
                                                    true
                                                ? const Loading()
                                                : SizedBox(
                                                    height: media.height * 1,
                                                    width: media.width * 1,
                                                    child: Obx(
                                                      () => GoogleMap(
                                                        onMapCreated:
                                                            HomeController
                                                                .to.mapCreation,
                                                        initialCameraPosition:
                                                            CameraPosition(
                                                                target:
                                                                    HomeController
                                                                        .to
                                                                        .center,
                                                                zoom: 18.0),
                                                        markers:
                                                            Set<Marker>.from(
                                                                HomeController
                                                                    .to.marker),
                                                        circles: buildSet(),

                                                        // polylines: HomeController.to.polyline,
                                                        minMaxZoomPreference:
                                                            const MinMaxZoomPreference(
                                                                0.0, 20.0),
                                                        myLocationButtonEnabled:
                                                            true,
                                                        compassEnabled: false,
                                                        buildingsEnabled: false,
                                                        zoomControlsEnabled:
                                                            false,
                                                      ),
                                                    )),
                                          ),
                                          Positioned(
                                            bottom: 80,
                                            right: 20,
                                            child: InkWell(
                                              onTap: () async {
                                                HomeController.to.mapController!
                                                    .animateCamera(CameraUpdate
                                                        .newLatLngZoom(
                                                            HomeController
                                                                .to.center,
                                                            18.0));
                                              },
                                              child: Container(
                                                height: media.width * 0.1,
                                                width: media.width * 0.1,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 2,
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          spreadRadius: 2)
                                                    ],
                                                    color: AppColors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            media.width *
                                                                0.02)),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                    Icons.my_location_sharp,
                                                    size: media.width * 0.06),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.all(10.0),
                                              height: 55,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      AppColors.primary,
                                                      AppColors.secondary
                                                    ]),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  buildIcon(
                                                      index: 0,
                                                      icon: Icons.home_outlined,
                                                      onTap: () {
                                                        HomeController.to
                                                            .selectedIndex = 0;
                                                      }),
                                                  buildIcon(
                                                      index: 1,
                                                      icon: Icons
                                                          .local_hospital_outlined,
                                                      onTap: () {
                                                        HomeController.to
                                                            .selectedIndex = 1;
                                                      }),
                                                  buildIcon(
                                                      index: 2,
                                                      icon: Icons
                                                          .shopping_bag_outlined,
                                                      onTap: () {
                                                        HomeController.to
                                                            .selectedIndex = 2;
                                                      }),
                                                  buildIcon(
                                                      index: 3,
                                                      icon: Icons
                                                          .shopping_cart_outlined,
                                                      onTap: () {
                                                        HomeController.to
                                                            .selectedIndex = 3;
                                                      }),
                                                  buildIcon(
                                                      index: 4,
                                                      icon:
                                                          Icons.person_outline,
                                                      onTap: () {
                                                        HomeController.to
                                                            .selectedIndex = 4;
                                                      }),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox()
                          ],
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: MainClipPath(),
                  ),
                  Positioned(
                    right: 10,
                    top: 45,
                    child: CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 6.0,
                      percent: 0.25,
                      center: CommonText(
                        text: "1 of 4",
                        style: mediumText(color: AppColors.white),
                      ),
                      progressColor: Colors.green,
                    ),
                  ),
                  // const Menu(),
                  // Obx(() => HomeController.to.isLoading == true
                  //     ? const Positioned(top: 0, child: Loading())
                  //     : Container()),
                ],
              )),
        );
      },
    );
  }

  Set<Circle> buildSet() {
    return {
      Circle(
        circleId: const CircleId('currentCircle'),
        center: LatLng(HomeController.to.center.latitude,
            HomeController.to.center.longitude),
        radius: 80,
        fillColor: Colors.blue.shade100.withOpacity(0.5),
        strokeColor: Colors.blue.shade100.withOpacity(0.1),
      ),
    };
  }

  dummy() {
    return Column(
      children: [
        const MainClipPath(),
        Positioned(
          right: 10,
          top: 10,
          child: CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 6.0,
            percent: 0.25,
            center: CommonText(
              text: "1 of 4",
              style: mediumText(color: AppColors.white),
            ),
            progressColor: Colors.green,
          ),
        ),
      ],
    );
  }

  Obx buildIcon({required index, required Function() onTap, required icon}) {
    return Obx(() => GestureDetector(
          onTap: onTap,
          child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HomeController.to.selectedIndex == index
                      ? AppColors.white
                      : Colors.transparent),
              child: Icon(
                icon,
                color: HomeController.to.selectedIndex == index
                    ? AppColors.primary
                    : AppColors.white,
              )),
        ));
  }
}
