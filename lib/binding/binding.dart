import 'dart:async';
import 'package:combine_proj/service/firestore/firestore.dart';
import 'package:combine_proj/service/location/location.dart';

class Binding {
  static Future<void> binging() async {
    await UserLocation.curentLatLng();
    await FirestoreService.initializeFirestoreInstance();
  }
}
