import 'package:combine_proj/flow/data_input_page/controller/controller.dart';
import 'package:combine_proj/flow/data_input_page/modal/student_data.dart';
import 'package:combine_proj/service/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_student_data_event.dart';
part 'upload_student_data_state.dart';

class UploadStudentDataBloc
    extends Bloc<UploadStudentDataEvent, UploadStudentDataState> {
  UploadStudentDataBloc()
      : super(const UploadStudentDataInitialState(status: 'Upload')) {
    on<UploadStudentDataEvent>((event, emit) async {
      emit(const UploadStudentDataLoadingState(status: 'Uploading...'));

      try {
        // uploading student data
        await FirestoreService.uploadStudentData(StudentData(
            rollNo: event.rollNo, name: event.name, phone: event.phone));
        await Future.delayed(const Duration(seconds: 2));
        emit(const UploadStudentDataLoadedState(status: 'Uploaded'));
        await Future.delayed(const Duration(seconds: 1));
        emit(const UploadStudentDataInitialState(status: 'Upload'));
        DataInputPageController.clearStudentDataFields();
      } catch (e) {
        emit(const UploadStudentDataLoadingState(status: 'Failed!'));
        await Future.delayed(const Duration(seconds: 2));
        emit(const UploadStudentDataInitialState(status: 'Upload'));
      }
    });
  }
}
