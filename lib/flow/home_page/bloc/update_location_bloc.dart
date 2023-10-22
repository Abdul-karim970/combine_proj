import 'package:combine_proj/exports/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'update_location_event.dart';
part 'update_location_state.dart';

class UpdateLocationBloc
    extends Bloc<UpdateLocationEvent, UpdateLocationState> {
  UpdateLocationBloc()
      : super(InitialLocationState(initialLocation: currentLatLng!)) {
    on<UpdateLocationEvent>((event, emit) async {
      emit(UpdateCurrentLocationState(currentLocation: event.currentLocation));
    });
  }
}
