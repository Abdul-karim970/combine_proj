import 'package:combine_proj/exports/home_page.dart';
import 'package:combine_proj/flow/home_page/modal/current_loc_data_modal.dart';
import 'package:workmanager/workmanager.dart';

var modal = CurrentLocData(userName: 'AK', currentLocData: currentLatLng!);

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    return Future.value(true);
  });
}

class WorkManagerService {
  WorkManagerService._();
  static const backgroungLocationTracking = 'BackgroungLocationTracking';
  static const locationTracking = 'LocationTracking';

  static Workmanager workmanager = Workmanager();

  static void initializeWorkManager() {
    workmanager.initialize(callbackDispatcher, isInDebugMode: true);
    workmanager.registerPeriodicTask(
      backgroungLocationTracking,
      locationTracking,
      initialDelay: const Duration(seconds: 5),
    );
  }
}
