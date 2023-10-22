import 'package:combine_proj/utilities/colors/colors.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();
  static TextStyle get appButtonStyle {
    return TextStyle(
        color: AppColors.primaryColor, fontSize: ScreenSize.radius * 0.00006);
  }

  static TextStyle get appTextStyle1 {
    return TextStyle(
        color: AppColors.blackColor, fontSize: ScreenSize.radius * 0.00008);
  }
}
