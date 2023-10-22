import 'package:combine_proj/exports/home_page.dart';
import 'package:combine_proj/flow/home_page/controller/controller.dart';
import 'package:combine_proj/utilities/app_widgets/appbar.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final homePageController = HomePageController(context: context);
    return Scaffold(
      appBar: PracAppBar(context: context, pageTitle: 'Home'),
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const VerticalSpacing(height: 0.05),
              Text(
                'Google Map',
                style: AppTextStyle.appTextStyle1,
              ),
              const VerticalSpacing(height: 0.02),
              CupertinoButton.filled(
                  onPressed: homePageController.goStudentDataEnterPageOnTap,
                  child: const Icon(Icons.arrow_forward)),
              const VerticalSpacing(height: 0.02),
              const AppGoogleMap()
            ],
          ),
        ),
      ),
    );
  }
}
