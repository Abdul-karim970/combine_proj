import 'package:combine_proj/service/location/location.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppGoogleMap extends StatelessWidget {
  const AppGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width * 0.8,
      height: ScreenSize.height * 0.6,
      child: GoogleMap(
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          zoom: 16,
          target: currentLatLng ?? UserLocation.casLocation,
        ),
        buildingsEnabled: true,
        fortyFiveDegreeImageryEnabled: true,
        indoorViewEnabled: true,
        mapToolbarEnabled: true,
        markers: UserLocation.locationMarkers(),
        circles: UserLocation.locationCircles(),
      ),
    );
  }
}
