import 'package:shared_preferences/shared_preferences.dart';

class PrefData {

    static String defaultString = "default";
    static String mode = defaultString + "mode";


  static setThemeMode(int isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(mode, isFav);
  }

  static getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(mode) ?? 0;
  }

}