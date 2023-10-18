import 'package:combine_proj/flow/home_page/widget/google_map.dart';
import 'package:combine_proj/service/location/location.dart';
import 'package:combine_proj/utils/gaps/gaps.dart';
import 'package:combine_proj/utils/screen_size/screen_size.dart';
import 'package:combine_proj/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const VerticalSpacing(height: 0.05),
            Text(
              'Google Map',
              style: AppTextStyle.appTextStyle1,
            ),
            const VerticalSpacing(height: 0.02),
            const AppGoogleMap()
          ],
        ),
      ),
    );
  }
}
