import 'package:combine_proj/navigation/routes_name/rout_name.dart';
import 'package:flutter/material.dart';

class HomePageController {
  BuildContext context;
  HomePageController({required this.context});

  void goStudentDataEnterPageOnTap() {
    Navigator.pushNamed(context, RoutsName.studentDataEnterPageName);
  }
}
