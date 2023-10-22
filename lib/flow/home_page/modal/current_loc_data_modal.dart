// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocData {
  String userName;
  LatLng currentLocData;
  CurrentLocData({
    required this.userName,
    required this.currentLocData,
  });

  CurrentLocData copyWith({
    String? userName,
    LatLng? currentLocData,
  }) {
    return CurrentLocData(
      userName: userName ?? this.userName,
      currentLocData: currentLocData ?? this.currentLocData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'currentLocData':
          GeoPoint(currentLocData.latitude, currentLocData.longitude),
    };
  }

  factory CurrentLocData.fromMap(Map<String, dynamic> map) {
    return CurrentLocData(
      userName: map['userName'] as String,
      currentLocData: map['currentLocData'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentLocData.fromJson(String source) =>
      CurrentLocData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CurrentLocData(userName: $userName, currentLocData: ${currentLocData.latitude} \n ${currentLocData.longitude}))}';

  @override
  bool operator ==(covariant CurrentLocData other) {
    if (identical(this, other)) return true;

    return other.userName == userName && other.currentLocData == currentLocData;
  }

  @override
  int get hashCode => userName.hashCode ^ currentLocData.hashCode;
}
