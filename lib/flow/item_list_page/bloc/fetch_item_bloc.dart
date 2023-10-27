import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:combine_proj/flow/data_input_page/modal/student_data.dart';
import 'package:combine_proj/flow/item_list_page/controller/controller.dart';
import 'package:combine_proj/service/firestore/firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'fetch_item_event.dart';
part 'fetch_item_state.dart';

class FetchItemBloc extends Bloc<FetchItemEvent, FetchItemState> {
  // Objects
  ItemListController itemListController = ItemListController();

  FetchItemBloc() : super(FetchItemInitialState(initialText: 'No data yet')) {
    on<FetchItemEvent>((event, emit) async {
      emit(FetchItemLoadingState());
      try {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> querySnapshots =
            await FirestoreService.fetchItems(event.typeNameToFilter);
        List<ItemModel> items = itemListController
            .convertQueryDocumentSnapshotToItemList(querySnapshots);

        if (items.isEmpty) {
          emit(FetchItemInitialState(initialText: 'No date found!'));
        } else {
          emit(FetchItemLoadedState(items: items));
        }
      } catch (e) {
        emit(FetchItemErrorState(error: e.toString()));
      }
    });
  }
}
