// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../core/database/shared_manager.dart';
import '../../../../core/enums/global_enums.dart';

class ThemeModel extends ChangeNotifier {
  final SharedManager _preferences = SharedManager();
  bool _isDark = false;
  bool get isDark => _isDark;
  IconData iconNiglight = Icons.nightlight_round;
  IconData iconSunny = Icons.wb_sunny;
  IconData get currentIcon => _isDark ? iconNiglight : iconSunny;

  ThemeModel() {
    _initPreferences();
  }

  void _initPreferences() async {
    await _preferences.init();
    getPreferences();
  }

  getPreferences() {
    _isDark = _preferences.getBool(Themes.theme) ?? false;
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setBool(Themes.theme, value);
    notifyListeners();
  }
}
