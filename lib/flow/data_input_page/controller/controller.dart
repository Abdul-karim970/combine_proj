import 'package:combine_proj/flow/data_input_page/bloc/upload_student_data_bloc.dart';
import 'package:combine_proj/flow/data_input_page/pick_image_bloc/pick_image_bloc.dart';
import 'package:combine_proj/flow/data_input_page/type_drop_down/type_drop_down_bloc.dart';
import 'package:combine_proj/service/firestore/firestore.dart';
import 'package:combine_proj/utilities/assets/assets_paths.dart';
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

  // Upload data onTap
  void uploadStudentDataOnTap() {
    var itemType = context.read<TypeDropDownBloc>().state.value;
    if (rollNoController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        (context.read<PickImageBloc>().state as PickImageLoadedState).image !=
            AssetsPath.pickFileImage &&
        itemType != FirestoreService.dropdownButtonInitialValue) {
      context.read<UploadStudentDataBloc>().add(UploadItemDataEvent(
          itemType: itemType,
          itemId: rollNoController.text,
          itemName: nameController.text,
          itemPrice: phoneController.text));
    }
  }

  // Clear textfields
  void clearStudentDataFields() {
    rollNoController.clear();
    nameController.clear();
    phoneController.clear();
    context.read<PickImageBloc>().add(RemoveImageEvent());
    context.read<TypeDropDownBloc>().add(ChangeDropDownValueEvent(
        selectedValue: FirestoreService.dropdownButtonInitialValue));
  }

  // image picker in tap
  void imagePickerOnTap() {
    context.read<PickImageBloc>().add(PickImageEvent());
  }
  // list of types DropdownButton

  String? hint;

  // DropdownButton on change

  void dropDownOnChange(String? value) {
    context
        .read<TypeDropDownBloc>()
        .add(ChangeDropDownValueEvent(selectedValue: value!));
  }
}
