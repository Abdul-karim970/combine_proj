import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static late SharedPreferences instance;
  static Future<void> getInstance() async {
    instance = await SharedPreferences.getInstance();
  }

  // check is data present

  static bool isDataInGivenRef(String key) {
    return instance.getString(key)!.isNotEmpty;
  }

  // remove data on ref

  static void removeDataOnKey(String key) {
    instance.setString(key, '');
  }
}
