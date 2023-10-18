import 'package:combine_proj/flow/home_page/modal/markers_modal.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapRepo {
  GoogleMapRepo._();
  static List<MarkersModal> locList = [
    MarkersModal(
        markerId: 'Home', markerLocation: const LatLng(29.394859, 71.704117)),
    MarkersModal(
        markerId: 'Work', markerLocation: const LatLng(29.382932, 71.715578)),
    MarkersModal(
        markerId: 'Any', markerLocation: const LatLng(29.382942, 71.71578))
  ];
}
