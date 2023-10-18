import 'package:combine_proj/service/location/location.dart';

class Binding {
  static Future<void> binging() async {
    currentLatLng = await UserLocation.curentLatLng();
  }
}
