import 'dart:async';
import 'package:combine_proj/service/location/location.dart';
import 'package:combine_proj/service/shared_pref/shared_pref.dart';

class Binding {
  static Future<void> binging() async {
    await UserLocation.curentLatLng();
    await SharedPrefService.getInstance();
  }
}
