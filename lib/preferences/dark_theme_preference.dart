import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "theme_status";
  final SharedPreferences preferences;
  DarkThemePreference({required this.preferences});

  bool? _darkThemeStatus;
  bool get darkThemeStatus {
    if (_darkThemeStatus == null) {
      _darkThemeStatus = preferences.getBool(THEME_STATUS) ?? false;
    }
    return _darkThemeStatus ?? false;
  }

  set darkThemeStatus(bool value) {
    _darkThemeStatus = value;
    preferences.setBool(THEME_STATUS, value);
  }
}
