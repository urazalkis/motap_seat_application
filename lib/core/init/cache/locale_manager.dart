import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/enum/locale_keys_enum.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  /*Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences!.clear();
      await setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    }
  }*/

  Future<void> setStringValue(PreferencesKeys key, String value) async {

    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }
  Future<void> clearStringValue(PreferencesKeys key) async {

    await _preferences!.remove(key.toString());
  }

  Future<void> clearBoolValue(PreferencesKeys key) async {
    await _preferences!.remove(key.toString());
  }

 String getStringValue(PreferencesKeys key) =>
      _preferences?.getString(key.toString()) ?? '';

  bool getBoolValue(PreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? false;
}