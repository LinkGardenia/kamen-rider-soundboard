import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_manager.dart';
import 'system/system_home.dart';
import 'download/download_home.dart';
import 'settings/settings_home.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});
  @override State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _idx = 0;
  static const _pages = [SystemHome(), DownloadHome(), SettingsHome()];

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    return Scaffold(
      body: IndexedStack(index: _idx, children: _pages),
      bottomNavigationBar: Container(decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.colors.accent.withOpacity(0.5), width: 3)),
        boxShadow: [BoxShadow(color: theme.colors.glow.withOpacity(0.2), blurRadius: 12, offset: const Offset(0, -2))]),
        child: BottomNavigationBar(currentIndex: _idx, onTap: (i) => setState(() => _idx = i),
          backgroundColor: theme.colors.surface, selectedItemColor: theme.colors.accent,
          unselectedItemColor: theme.colors.textSecondary, selectedFontSize: 14, unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed, items: const [
            BottomNavigationBarItem(icon: Icon(Icons.transform, size: 26), label: '假面骑士系统'),
            BottomNavigationBarItem(icon: Icon(Icons.download_rounded, size: 26), label: '音效下载'),
            BottomNavigationBarItem(icon: Icon(Icons.settings, size: 26), label: '设置'),
          ])));
  }
}
