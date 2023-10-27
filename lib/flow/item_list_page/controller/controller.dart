import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:combine_proj/flow/data_input_page/modal/student_data.dart';
import 'package:combine_proj/flow/item_list_page/modal/filter_model.dart';
import 'package:combine_proj/service/firestore/firestore.dart';

class ItemListController {
  // List of filters
  List<ItemFilterModel> filters() {
    List<String> filtersList = ['All', ...FirestoreService.itemTypes.skip(1)];
    return filtersList.map((filter) => ItemFilterModel(item: filter)).toList();
  }

  // convert QueryDocumentSnapshot list to Item list
  List<ItemModel> convertQueryDocumentSnapshotToItemList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> items) {
    return items.map((doc) => ItemModel.fromMap(doc.data())).toList();
  }

  // filters onTap
}
