part of 'upload_student_data_bloc.dart';

class UploadStudentDataEvent {
  final String rollNo;
  final String name;
  final String phone;
  UploadStudentDataEvent(
      {required this.rollNo, required this.name, required this.phone});
}
