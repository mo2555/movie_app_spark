import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static setData({required String key, required bool value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(key, value);
  }

  static getData({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(key)) {
      return  sharedPreferences.getBool(key);
    } else {
      return false;
    }
  }
}
