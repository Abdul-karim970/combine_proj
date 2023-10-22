import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:combine_proj/flow/data_input_page/modal/student_data.dart';
import 'package:combine_proj/flow/home_page/modal/current_loc_data_modal.dart';
import 'package:combine_proj/service/firestore/forestore_constants.dart';

class FirestoreService {
  FirestoreService._();

  // Instance
  static late FirebaseFirestore instance;

  // Initialize instance
  static Future<void> initializeFirestoreInstance() async {
    instance = FirebaseFirestore.instance;
  }

  // Add doc data
  static Future<void> updateLocation(CurrentLocData currentLocData) async {
    await instance
        .collection(FireStoreConstants.userLocationCol)
        .doc(currentLocData.userName)
        .set(currentLocData.toMap(), SetOptions(merge: true));
  }

  // uploading student data
  static Future<void> uploadStudentData(StudentData studentData) async {
    await instance
        .collection(FireStoreConstants.studentsEnrolled)
        .doc(studentData.rollNo.toString())
        .set(studentData.toMap(), SetOptions(merge: true));
  }
}
