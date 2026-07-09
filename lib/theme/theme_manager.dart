import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';
import 'themes/zzz_theme.dart';
import 'themes/neo_cyber_theme.dart';
import 'themes/showa_retro_theme.dart';
import 'themes/heisei_classic_theme.dart';
import 'themes/reiwa_future_theme.dart';
import '../utils/constants.dart';

class ThemeManager extends ChangeNotifier {
  static final availableThemes = [
    ZZZTheme.data, NeoCyberTheme.data, ShowaRetroTheme.data,
    HeiseiClassicTheme.data, ReiwaFutureTheme.data,
  ];

  AppThemeData _current = ZZZTheme.data;
  AppThemeData get currentTheme => _current;
  ThemeData get materialTheme => _current.toMaterialTheme();

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString(AppConstants.keyCurrentTheme);
    if (id != null) {
      try { _current = availableThemes.firstWhere((t) => t.id == id); } catch (_) {}
      notifyListeners();
    }
  }

  Future<void> switchTheme(String id) async {
    try {
      final t = availableThemes.firstWhere((x) => x.id == id);
      if (t.id != _current.id) { _current = t; notifyListeners(); }
      (await SharedPreferences.getInstance()).setString(AppConstants.keyCurrentTheme, id);
    } catch (_) {}
  }

  int get currentIndex {
    final i = availableThemes.indexWhere((t) => t.id == _current.id);
    return i >= 0 ? i : 0;
  }
}
