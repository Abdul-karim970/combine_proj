part of 'update_location_bloc.dart';

@immutable
sealed class UpdateLocationState {}

final class InitialLocationState extends UpdateLocationState {
  final LatLng initialLocation;
  InitialLocationState({required this.initialLocation});
}

final class UpdateCurrentLocationState extends UpdateLocationState {
  final LatLng currentLocation;
  UpdateCurrentLocationState({required this.currentLocation});
}
