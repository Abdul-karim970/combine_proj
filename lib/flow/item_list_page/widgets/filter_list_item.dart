import 'package:combine_proj/utilities/colors/colors.dart';
import 'package:combine_proj/utilities/constants/value_constants.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.filterName, required this.onTap});
  final String filterName;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: ValueContants.value5, right: ValueContants.value5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: ScreenSize.height * 0.02,
          width: ScreenSize.width * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ValueContants.value10),
              border: Border.all(color: AppColors.seconsaryColor)),
          child: Text(
            filterName,
            style: TextStyle(
                color: AppColors.seconsaryColor,
                fontSize: ScreenSize.radius * 0.00005),
          ),
        ),
      ),
    );
  }
}
