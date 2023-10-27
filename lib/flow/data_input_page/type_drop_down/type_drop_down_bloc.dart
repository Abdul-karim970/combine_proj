import 'package:combine_proj/service/firestore/firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'type_drop_down_event.dart';
part 'type_drop_down_state.dart';

class TypeDropDownBloc
    extends Bloc<ChangeDropDownValueEvent, DropDownTypeState> {
  TypeDropDownBloc()
      : super(DropDownTypeState(
            value: FirestoreService.dropdownButtonInitialValue)) {
    on<ChangeDropDownValueEvent>((event, emit) {
      emit(DropDownTypeState(value: event.selectedValue));
    });
  }
}
