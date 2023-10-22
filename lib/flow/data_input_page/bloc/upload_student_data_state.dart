part of 'upload_student_data_bloc.dart';

@immutable
sealed class UploadStudentDataState {
  const UploadStudentDataState();
}

final class UploadStudentDataInitialState extends UploadStudentDataState {
  final String status;
  const UploadStudentDataInitialState({required this.status});
}

final class UploadStudentDataLoadingState extends UploadStudentDataState {
  final String status;
  const UploadStudentDataLoadingState({required this.status});
}

final class UploadStudentDataLoadedState extends UploadStudentDataState {
  final String status;
  const UploadStudentDataLoadedState({required this.status});
}

final class UploadStudentDataErrorState extends UploadStudentDataState {
  final String status;
  const UploadStudentDataErrorState({required this.status});
}
