part of 'upload_student_data_bloc.dart';

class UploadItemDataEvent {
  final String itemId;
  final String itemName;
  final String itemPrice;
  final String itemType;
  UploadItemDataEvent(
      {required this.itemType,
      required this.itemId,
      required this.itemName,
      required this.itemPrice});
}
