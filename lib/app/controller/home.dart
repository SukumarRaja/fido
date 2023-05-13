import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());
  GoogleMapController? mapController;
  Location location = Location();

  dynamic center;
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

  void mapCreation(GoogleMapController controller) {
    mapController = controller;
    // mapController!.setMapStyle(mapStyle);
  }

  getPermissionAndCurrentLocation() async {
    var permission = await location.hasPermission();
    var serviceEnabled = await location.serviceEnabled();

    if (permission == PermissionStatus.denied ||
        permission == PermissionStatus.deniedForever ||
        serviceEnabled == false) {
      locationDenied = true;
    } else if (permission == PermissionStatus.granted ||
        permission == PermissionStatus.grantedLimited) {
      dynamic markerIcon;
      locationDenied = false;
      if (center == null) {
        var loc = await Geolocator.getLastKnownPosition();
        if (loc != null) {
          center = LatLng(loc.longitude, loc.longitude);
        } else {
          var loc = await Geolocator.getCurrentPosition();
          center = LatLng(double.parse(loc.latitude.toString()),
              double.parse(loc.longitude.toString()));
        }
      }
      // var pinLocationIcon = BitmapDescriptor.fromBytes(markerIcon);
    }
  }
}
