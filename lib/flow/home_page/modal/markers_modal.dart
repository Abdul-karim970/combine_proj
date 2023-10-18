// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkersModal {
  String markerId;
  LatLng markerLocation;
  MarkersModal({
    required this.markerId,
    required this.markerLocation,
  });

  MarkersModal copyWith({
    String? markerId,
    LatLng? markerLocation,
  }) {
    return MarkersModal(
      markerId: markerId ?? this.markerId,
      markerLocation: markerLocation ?? this.markerLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'markerId': markerId,
      'markerLocation': markerLocation,
    };
  }

  factory MarkersModal.fromMap(Map<String, dynamic> map) {
    return MarkersModal(
      markerId: map['markerId'] as String,
      markerLocation: map['markerLocation'] as LatLng,
    );
  }

  String toJson() => json.encode(toMap());

  factory MarkersModal.fromJson(String source) =>
      MarkersModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MarkersModal(markerId: $markerId, markerLocation: $markerLocation)';

  @override
  bool operator ==(covariant MarkersModal other) {
    if (identical(this, other)) return true;

    return other.markerId == markerId && other.markerLocation == markerLocation;
  }

  @override
  int get hashCode => markerId.hashCode ^ markerLocation.hashCode;
}
