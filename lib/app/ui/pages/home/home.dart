import 'package:fido/app/controller/home.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:fido/app/ui/themes/font_size.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/circle_percent_indicator.dart';
import '../../widgets/home/location_allow_card.dart';
import '../../widgets/main_clip_path.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      initState: (_) {
        HomeController.to.getPermissionAndCurrentLocation();
      },
      builder: (_) {
        var media = MediaQuery.of(context).size;
        return Scaffold(
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
                                        SizedBox(
                                          height: Get.height * 1,
                                          width: Get.width * 1,
                                          child: Obx(() => GoogleMap(
                                                onMapCreated: HomeController
                                                    .to.mapCreation,
                                                initialCameraPosition:
                                                    CameraPosition(
                                                  // target: HomeController.to.center,
                                                  target: LatLng(11.0102, 76.9504),
                                                  tilt: 59.440717697143555,
                                                  zoom: 11.0,
                                                ),
                                                markers: Set<Marker>.from(
                                                    HomeController.to.marker),
                                                // polylines: MapController.to.polyline,
                                                minMaxZoomPreference:
                                                    const MinMaxZoomPreference(
                                                        0.0, 20.0),
                                                myLocationButtonEnabled: true,
                                                compassEnabled: false,
                                                buildingsEnabled: false,
                                                zoomControlsEnabled: false,
                                              )),
                                        ),
                                      ],
                                    )
                                  : const SizedBox()
                        ],
                      ),
                    )),

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
            ),
          ),
        );
      },
    );
  }
}
