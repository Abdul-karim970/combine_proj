import 'package:combine_proj/flow/data_input_page/bloc/upload_student_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataInputPageController {
  final BuildContext context;
  DataInputPageController({required this.context});

  // Text controller
  static late TextEditingController rollNoController;
  static late TextEditingController nameController;
  static late TextEditingController phoneController;

  static void initializeControllers() {
    rollNoController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  static void disposeController() {
    rollNoController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  void uploadStudentDataOnTap() {
    if (rollNoController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      context.read<UploadStudentDataBloc>().add(UploadStudentDataEvent(
          rollNo: rollNoController.text,
          name: nameController.text,
          phone: phoneController.text));
    }
  }

  static void clearStudentDataFields() {
    rollNoController.clear();
    nameController.clear();
    phoneController.clear();
  }
}
