import 'dart:async';
import 'package:combine_proj/flow/home_page/modal/current_loc_data_modal.dart';
import 'package:combine_proj/service/firestore/firestore.dart';
import 'package:combine_proj/service/firestore/markers_loc_repo.dart';
import 'package:combine_proj/utilities/colors/colors.dart';
import 'package:combine_proj/utilities/constants/value_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

// Current LatLng
late LatLng? currentLatLng;

class UserLocation {
  UserLocation._();

  static var homeLocation = const LatLng(29.394859, 71.704117);
  static var casLocation = const LatLng(29.382932, 71.715578);

  static final Location _location = Location();

  // Update location periodicly

  static Future<void> updateLocation(CurrentLocData currentLocData) async {
    await FirestoreService.updateLocation(currentLocData);
  }

  // Current LatLng
  static Future<void> curentLatLng() async {
    PermissionStatus status = await _location.hasPermission();
    if (status == PermissionStatus.denied) {
      await _location.requestPermission();
    }
    LocationData locationData = await _location.getLocation();
    currentLatLng = LatLng(locationData.latitude!, locationData.longitude!);
  }

  // Location marker
  static Set<Marker> locationMarkers() {
    Set<Marker> markersSet = GoogleMapRepo.locList
        .map((loc) => Marker(
            markerId: MarkerId(loc.markerId),
            infoWindow: InfoWindow(title: loc.markerId),
            position: loc.markerLocation))
        .toSet();
    return markersSet;
  }

  // Location circles
  static Set<Circle> locationCircles() {
    Set<Circle> markersSet = GoogleMapRepo.locList
        .map((loc) => Circle(
            fillColor: AppColors.googleMapCircleColor,
            radius: ValueContants.mapCircleRadius,
            strokeColor: AppColors.blackColor,
            strokeWidth: ValueContants.value1.toInt(),
            circleId: CircleId(loc.markerId),
            center: loc.markerLocation))
        .toSet();
    return markersSet;
  }
}
