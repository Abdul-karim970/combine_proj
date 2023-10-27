import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:combine_proj/flow/data_input_page/modal/student_data.dart';
import 'package:combine_proj/flow/home_page/modal/current_loc_data_modal.dart';
import 'package:combine_proj/service/firestore/forestore_constants.dart';

class FirestoreService {
  FirestoreService._();

  // Instance
  static FirebaseFirestore instance = FirebaseFirestore.instance;

  // Add doc data
  static Future<void> updateLocation(CurrentLocData currentLocData) async {
    await instance
        .collection(FireStoreConstants.userLocationCol)
        .doc(currentLocData.userName)
        .set(currentLocData.toMap(), SetOptions(merge: true));
  }

  // uploading student data
  static Future<void> uploadStudentData(ItemModel studentData) async {
    await instance
        .collection(FireStoreConstants.itemUploadedCol)
        .doc(studentData.itemId.toString())
        .set(studentData.toMap(), SetOptions(merge: true));
  }

  // fetching items
  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchItems(
      String typeNameToFilter) async {
    QuerySnapshot<Map<String, dynamic>> docs = !typeNameToFilter.endsWith('All')
        ? await instance
            .collection(FireStoreConstants.itemUploadedCol)
            .orderBy(FireStoreConstants.uploadedItemQueryField)
            .where(FireStoreConstants.uploadedItemTypeField,
                isEqualTo: typeNameToFilter)
            .get()
        : await instance
            .collection(FireStoreConstants.itemUploadedCol)
            .orderBy(FireStoreConstants.uploadedItemQueryField)
            .get();
    return docs.docs;
  }

  // fetch items types
  static const dropdownButtonInitialValue = 'Select type';
  static List<String> get itemTypes {
    return [
      dropdownButtonInitialValue,
      'type1',
      'type2',
      'type3',
      'type4',
      'type5',
      'type6'
    ];
  }
}
