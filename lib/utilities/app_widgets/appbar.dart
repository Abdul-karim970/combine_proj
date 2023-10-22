import 'package:combine_proj/utilities/colors/colors.dart';
import 'package:flutter/material.dart';

class PracAppBar extends AppBar {
  PracAppBar(
      {required BuildContext context, required String pageTitle, super.key})
      : super(
          backgroundColor: AppColors.seconsaryColor,
          title: Text(pageTitle),
        );
}
