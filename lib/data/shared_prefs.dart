import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences _sharedPrefs;

Future<void> initializeSharedPrefs() async {
  _sharedPrefs = await SharedPreferences.getInstance();
}

Future<void> saveDarkmode(bool value) async {
  await _sharedPrefs.setBool("darkmode", value);
}

bool loadDarkmode() {
  return _sharedPrefs.getBool("darkmode") ?? false;
}
