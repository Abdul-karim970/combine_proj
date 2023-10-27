import 'package:combine_proj/flow/data_input_page/modal/student_data.dart';
import 'package:combine_proj/service/firebase_storage/firebase_storage.dart';
import 'package:combine_proj/service/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'upload_student_data_event.dart';
part 'upload_student_data_state.dart';

class UploadStudentDataBloc
    extends Bloc<UploadItemDataEvent, UploadStudentDataState> {
  // Objects
  FirebaseStorageService firebaseStorage = FirebaseStorageService();

  UploadStudentDataBloc()
      : super(const UploadStudentDataInitialState(status: 'Upload')) {
    on<UploadItemDataEvent>((event, emit) async {
      emit(const UploadStudentDataLoadingState(status: 'Uploading...'));

      try {
        await firebaseStorage.uploadItemImage(event.itemId);
        String imageURL = await firebaseStorage.getItemImageUrl(event.itemId);

        // uploading student data
        await FirestoreService.uploadStudentData(ItemModel(
            itemType: event.itemType,
            timeQuery: DateTime.now().toString(),
            itemId: event.itemId,
            itemName: event.itemName,
            itemPrice: event.itemPrice,
            itemImage: imageURL));
        emit(const UploadStudentDataLoadedState(status: 'Uploaded'));
        await Future.delayed(const Duration(seconds: 1));
        emit(const UploadStudentDataInitialState(status: 'Upload'));
      } catch (e) {
        emit(const UploadStudentDataInitialState(status: 'Failed!'));
        await Future.delayed(const Duration(seconds: 2));
        emit(const UploadStudentDataInitialState(status: 'Upload'));
      }
    });
  }
}
