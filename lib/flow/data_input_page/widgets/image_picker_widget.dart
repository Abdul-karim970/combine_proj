import 'dart:io';
import 'package:combine_proj/flow/data_input_page/controller/controller.dart';
import 'package:combine_proj/utilities/assets/assets_paths.dart';
import 'package:combine_proj/utilities/constants/value_constants.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    DataInputPageController dataInputPageController =
        DataInputPageController(context: context);
    return InkWell(
      onTap: dataInputPageController.imagePickerOnTap,
      child: Container(
        width: ScreenSize.width * 5,
        height: ScreenSize.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ValueContants.value10),
            image: image != AssetsPath.pickFileImage
                ? ImageDecorator(image: FileImage(File(image)))
                : ImageDecorator(image: AssetImage(image))),
      ),
    );
  }
}

class ImageDecorator extends DecorationImage {
  const ImageDecorator({required super.image}) : super(fit: BoxFit.scaleDown);
}
