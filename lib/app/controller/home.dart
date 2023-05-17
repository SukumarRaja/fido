import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;
int statusCode=0;
class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());
  GoogleMapController? mapController;
  Location location = Location();

  dynamic center;
  dynamic pinLocationIcon;

  final TextEditingController searchController = TextEditingController();

  final _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;

  set selectedIndex(value) {
    _selectedIndex.value = value;
  }

  final _locationDenied = false.obs;

  get locationDenied => _locationDenied.value;

  set locationDenied(value) {
    _locationDenied.value = value;
  }

  final _marker = <Marker>[].obs;

  get marker => _marker.value;

  set marker(value) {
    _marker.value = value;
  }

  final _circles = <Circle>{}.obs;

  get circles => _circles.value;

  set circles(value) {
    _circles.value = value;
  }

  final _mapStyle = "".obs;

  get mapStyle => _mapStyle.value;

  set mapStyle(value) {
    _mapStyle.value = value;
  }

  final _isLoading = false.obs;

  get isLoading => _isLoading.value;

  set isLoading(value) {
    _isLoading.value = value;
  }

  final _heading = 0.0.obs;

  get heading => _heading.value;

  set heading(value) {
    _heading.value = value;
  }

  void mapCreation(GoogleMapController controller) {
    mapController = controller;

    // rootBundle.loadString('assets/map_style.json').then((value) {
    //   mapStyle = value;
    // });
    // mapController!.setMapStyle(mapStyle);
  }

  getPermissionAndCurrentLocation() async {
    isLoading = true;
    var permission = await location.hasPermission();
    var serviceEnabled = await location.serviceEnabled();

    if (permission == PermissionStatus.denied ||
        permission == PermissionStatus.deniedForever ||
        serviceEnabled == false) {
      locationDenied = true;
    } else if (permission == PermissionStatus.granted ||
        permission == PermissionStatus.grantedLimited) {
      final Uint8List markerIcon =
          await getBytesFromAsset('assets/images/logo.png', 50);
      locationDenied = false;
      print("center first is $center");
      if (center == null) {
        var loc = await Geolocator.getLastKnownPosition();
        if (loc != null) {
          isLoading = false;
          center = LatLng(loc.latitude, loc.longitude);
          circles = {
            Circle(
              circleId: const CircleId("1"),
              center: LatLng(loc.latitude, loc.longitude),
              radius: 4000,
            )
          };
          print("center second is $center");
        } else {
          var loc = await Geolocator.getCurrentPosition();
          center = LatLng(double.parse(loc.latitude.toString()),
              double.parse(loc.longitude.toString()));
        }
      }
      pinLocationIcon = BitmapDescriptor.fromBytes(markerIcon);
    }
    if (marker.isEmpty) {
      marker = [
        Marker(
            markerId: const MarkerId('1'),
            rotation: heading,
            position: center,
            icon: pinLocationIcon,
            anchor: const Offset(0.5, 0.5),
            infoWindow: InfoWindow(
                title: "Hi",
                snippet: "kjhlkjhkjhk",
                onTap: () {
                  print("kjhkjlhkjhlkj");
                }))
      ];
    }
    isLoading = false;
  }

  currentPositionUpdate() async {
    bool serviceEnabled;
    PermissionStatus permission;
    Location locs = Location();
    // GeoHasher geo = GeoHasher();

    Timer.periodic(const Duration(seconds: 5), (timer) async {
      serviceEnabled = await locs.serviceEnabled();
      permission = await locs.hasPermission();
      // if (userDetails['active'] == true &&
      if (permission == PermissionStatus.granted) {
        if (await locs.isBackgroundModeEnabled() == false) {
          // await locs.enableBackgroundMode(enable: true);
          // locs.changeNotificationOptions(iconName: '@mipmap/ic_launcher');
        }

        var pos = await Location.instance.getLocation();

        // Test if location services are enabled.

        center = LatLng(double.parse(pos.latitude.toString()),
            double.parse(pos.longitude.toString()));
        heading = pos.heading;
        update();
        update();
      } else if (serviceEnabled == true &&
          permission != PermissionStatus.denied) {
        var pos = await Geolocator.getCurrentPosition();
        update();
        update();
        center = LatLng(double.parse(pos.latitude.toString()),
            double.parse(pos.longitude.toString()));
        update();
        update();
      }
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
