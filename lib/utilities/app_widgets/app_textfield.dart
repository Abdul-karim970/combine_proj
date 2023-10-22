import 'package:combine_proj/utilities/colors/colors.dart';
import 'package:combine_proj/utilities/constants/value_constants.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      required this.hint,
      required this.label,
      required this.keyboardType,
      required this.controller});
  final String hint;
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width * 0.8,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.seconsaryColor,
                    width: ValueContants.value1),
                borderRadius: BorderRadius.circular(ValueContants.value10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.seconsaryColor,
                    width: ValueContants.value2),
                borderRadius: BorderRadius.circular(ValueContants.value10))),
      ),
    );
  }
}
