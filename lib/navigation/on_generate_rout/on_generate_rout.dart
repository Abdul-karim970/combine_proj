import 'package:combine_proj/flow/data_input_page/bloc/upload_student_data_bloc.dart';
import 'package:combine_proj/flow/data_input_page/view/view.dart';
import 'package:combine_proj/flow/error_page/view.dart';
import 'package:combine_proj/flow/home_page/view/view.dart';
import 'package:combine_proj/navigation/on_generate_rout/material_page_rout.dart';
import 'package:combine_proj/navigation/routes_name/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route? onGenerateRoute(RouteSettings settings) {
  if (settings.name == RoutsName.homePageName) {
    return PracMaterialPageRout(
        builder: _homePageRoutBuilder, settings: settings);
  } else if (settings.name == RoutsName.studentDataEnterPageName) {
    return PracMaterialPageRout(
        builder: _studentDataEnterPage, settings: settings);
  } else {
    return PracMaterialPageRout(builder: _errorPageBuilder, settings: settings);
  }
}

Widget _homePageRoutBuilder(BuildContext context) {
  return const MyHomePage();
}

Widget _studentDataEnterPage(BuildContext context) {
  return BlocProvider(
    create: (context) => UploadStudentDataBloc(),
    child: const InputDataPage(),
  );
}

Widget _errorPageBuilder(BuildContext context) {
  return const ErrorPage();
}
