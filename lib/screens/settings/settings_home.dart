import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_manager.dart';
import 'theme_picker_screen.dart';

class SettingsHome extends StatelessWidget {
  const SettingsHome({super.key});

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    return Scaffold(backgroundColor: theme.colors.background,
      appBar: AppBar(title: Text('设置', style: TextStyle(fontFamily: theme.typography.titleFontFamily, fontSize: 24, fontWeight: FontWeight.w900, color: theme.colors.accent)), backgroundColor: theme.colors.background, elevation: 0),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        _Card(title: '🎨 界面主题', subtitle: '当前：${theme.name}', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ThemePickerScreen())), theme: theme),
        const SizedBox(height: 16),
        _Card(title: 'ℹ️ 关于', subtitle: '假面骑士变身音效板 v1.0.0', onTap: () => showDialog(context: context, builder: (ctx) => AlertDialog(backgroundColor: theme.colors.surface, title: const Text('关于'), content: const Text('假面骑士变身音效板\n\n致敬假面骑士系列的粉丝向音效应用。\n收录平成至令和时代多位假面骑士经典音效。\n\n版权声明：所有音效版权归东映株式会社所有，\n本应用仅供粉丝交流学习。'), actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('确定'))])), theme: theme),
      ]));
  }
}

class _Card extends StatelessWidget {
  final String title, subtitle;
  final VoidCallback? onTap;
  final dynamic theme;
  const _Card({required this.title, required this.subtitle, this.onTap, required this.theme});

  @override Widget build(BuildContext context) => GestureDetector(onTap: onTap, child: Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: theme.colors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: theme.colors.accent.withOpacity(0.3), width: 2), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), offset: const Offset(3, 3), blurRadius: 0)]), child: Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.colors.textPrimary)), const SizedBox(height: 4), Text(subtitle, style: TextStyle(fontSize: 13, color: theme.colors.textSecondary))])), if (onTap != null) Icon(Icons.chevron_right, color: theme.colors.accent, size: 28)])));
}
