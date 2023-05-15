import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  // Future<String> getAppLanguage() async {
  //   String? appLanguage = _sharedPreferences.getString(PREFS_KEY_LANG);

  //   if (appLanguage != null && appLanguage.isNotEmpty) {
  //     return appLanguage;
  //   } else {
  //     return Language.ENGLISH.getValue();
  //   }
  // }
}
