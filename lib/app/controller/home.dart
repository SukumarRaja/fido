import 'dart:async';

import 'package:fido/app/controller/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;

int statusCode = 0;

class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());
  GoogleMapController? mapController;
  Location location = Location();

  dynamic center;
  dynamic pinLocationIcon;
  dynamic hos;
  dynamic match;
  dynamic shop;
  dynamic style;

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

  final _currentAddress = "".obs;

  get currentAddress => _currentAddress.value;

  set currentAddress(value) {
    _currentAddress.value = value;
  }

  final _getCurrentAddressLoading = false.obs;

  get getCurrentAddressLoading => _getCurrentAddressLoading.value;

  set getCurrentAddressLoading(value) {
    _getCurrentAddressLoading.value = value;
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
          await getBytesFromAsset('assets/images/logo.png', 55);
      final Uint8List hospital =
          await getBytesFromAsset('assets/images/hospital.png', 50);
      final Uint8List matching =
          await getBytesFromAsset('assets/images/matching.png', 80);
      final Uint8List shopping =
          await getBytesFromAsset('assets/images/shopping.png', 50);
      final Uint8List stylist =
          await getBytesFromAsset('assets/images/stylist.png', 50);

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
      hos = BitmapDescriptor.fromBytes(hospital);
      match = BitmapDescriptor.fromBytes(matching);
      shop = BitmapDescriptor.fromBytes(shopping);
      style = BitmapDescriptor.fromBytes(stylist);
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
                  Get.toNamed('/matching_pets');
                })),
        // Marker(
        //     markerId: const MarkerId('2'),
        //     rotation: heading,
        //     position: LatLng(-12.0063258, -76.9513407),
        //     icon: hos,
        //     anchor: const Offset(0.5, 0.5),
        //     infoWindow: InfoWindow(
        //         title: "Hospitals",
        //         snippet: "care your pets",
        //         onTap: () {
        //           Get.toNamed('/matching_pets');
        //         })),
        Marker(
            markerId: const MarkerId('3'),
            // rotation: heading,
            position: LatLng(11.0064258, 76.9516415),
            icon: match,
            anchor: const Offset(0.5, 0.5),
            infoWindow: InfoWindow(
                title: "Matching",
                snippet: "Let's matching your pet",
                onTap: () {
                  Get.toNamed('/matching_pets');
                })),
        // Marker(
        //     markerId: const MarkerId('4'),
        //     rotation: heading,
        //     position: LatLng(14.0063258,78.9513407),
        //     icon: shop,
        //     anchor: const Offset(0.5, 0.5),
        //     infoWindow: InfoWindow(
        //         title: "Shopping",
        //         snippet: "Shop your pet foods and grooms",
        //         onTap: () {
        //           Get.toNamed('/matching_pets');
        //         })),
        // Marker(
        //     markerId: const MarkerId('5'),
        //     rotation: heading,
        //     position:LatLng(11.0063258,76.9513407),
        //     icon: style,
        //     anchor: const Offset(0.5, 0.5),
        //     infoWindow: InfoWindow(
        //         title: "Stylist",
        //         snippet: "Find your best stylist",
        //         onTap: () {
        //           Get.toNamed('/matching_pets');
        //         })),
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

  Future<Map?> getCurrentAddress({required bool isAddAddress}) async {
    getCurrentAddressLoading = true;
    Location location = Location();
    try {
      Future.delayed(const Duration(seconds: 2), () async {
        getCurrentAddressLoading = false;
        await location.serviceEnabled().then((value) async {
          if (value != false) {
            await location.requestService();
          }
        });
        var coordinates = await location.getLocation();

        var obj = {};
        var coordinate =
            Coordinates(coordinates.latitude, coordinates.longitude);
        var result =
            await Geocoder.local.findAddressesFromCoordinates(coordinate);
        currentAddress =
            "${result.first.subLocality}, ${result.first.locality}, ${result.first.countryName}";
        if (isAddAddress == true) {
          ProfileController.to.addAddress1.text = result.first.subLocality!;
          // ProfileController.to.addAddress2.text = result.first.subAdminArea!;
          ProfileController.to.addCity.text = result.first.locality!;
          ProfileController.to.addState.text = result.first.adminArea!;
          ProfileController.to.addPincode.text = result.first.postalCode!;
        }
        debugPrint("current address is $currentAddress");
        obj['PlaceName'] = currentAddress;
        obj['latitude'] = coordinates.latitude;
        obj['longitude'] = coordinates.longitude;
        debugPrint("object of address is $obj");
        return obj;
      });
    } catch (e) {
      getCurrentAddressLoading = false;
      debugPrint("Error from get location coordinates $e");
    }
    return null;
  }
}
