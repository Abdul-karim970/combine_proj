import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePicker imagePicker = ImagePicker();

  // Pick image

  Future<XFile?> pickImage() async {
    XFile? file = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    return file;
  }
}
