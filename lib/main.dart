import 'package:combine_proj/binding/binding.dart';
import 'package:combine_proj/firebase_options.dart';
import 'package:combine_proj/flow/home_page/bloc/update_location_bloc.dart';
import 'package:combine_proj/exports/home_page.dart';
import 'package:combine_proj/navigation/on_generate_rout/on_generate_rout.dart';
import 'package:combine_proj/navigation/routes_name/rout_name.dart';
import 'package:combine_proj/utilities/colors/colors.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Binding.binging();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize(context);
    return BlocProvider(
      create: (context) => UpdateLocationBloc(),
      child: MaterialApp(
        title: 'Flutter Map',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.seconsaryColor),
          useMaterial3: true,
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: RoutsName.homePageName,
      ),
    );
  }
}
