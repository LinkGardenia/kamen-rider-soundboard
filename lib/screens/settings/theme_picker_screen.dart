import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_manager.dart';

class ThemePickerScreen extends StatelessWidget {
  const ThemePickerScreen({super.key});

  @override Widget build(BuildContext context) {
    final tm = context.watch<ThemeManager>();
    return Scaffold(backgroundColor: tm.currentTheme.colors.background,
      appBar: AppBar(title: Text('选择界面主题', style: TextStyle(fontFamily: tm.currentTheme.typography.accentFontFamily, fontSize: 20, color: tm.currentTheme.colors.accent)), backgroundColor: tm.currentTheme.colors.background, elevation: 0),
      body: ListView.builder(padding: const EdgeInsets.all(16), itemCount: ThemeManager.availableThemes.length, itemBuilder: (ctx, i) {
        final t = ThemeManager.availableThemes[i]; final sel = t.id == tm.currentTheme.id;
        return Padding(padding: const EdgeInsets.only(bottom: 12), child: GestureDetector(onTap: () => tm.switchTheme(t.id),
          child: AnimatedContainer(duration: const Duration(milliseconds: 300), padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: t.colors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: sel ? t.colors.accent : t.colors.accent.withOpacity(0.2), width: sel ? 3 : 1.5), boxShadow: sel ? [BoxShadow(color: t.colors.glow.withOpacity(0.4), blurRadius: 16)] : [BoxShadow(color: Colors.black.withOpacity(0.4), offset: const Offset(3, 3), blurRadius: 0)]),
            child: Row(children: [
              Container(width: 60, height: 60, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: LinearGradient(colors: [t.colors.primary, t.colors.secondary]), border: Border.all(color: t.colors.accent.withOpacity(0.5), width: 2))),
              const SizedBox(width: 16),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: sel ? t.colors.accent : Colors.white)),
                const SizedBox(height: 4), Text(t.description, style: TextStyle(fontSize: 12, color: Colors.white60)),
                const SizedBox(height: 6),
                Wrap(spacing: 6, children: [
                  if (t.hasCRTEffect) _Chip('📺 CRT'), if (t.hasGlitchEffect) _Chip('🔧 故障'), if (t.hasParticleEffect) _Chip('✨ 粒子'),
                ]),
              ])),
              if (sel) Icon(Icons.check_circle, color: t.colors.accent, size: 28),
            ]))));
      }));
  }
}

class _Chip extends StatelessWidget {
  final String l; const _Chip(this.l);
  @override Widget build(BuildContext c) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.white.withOpacity(0.2))), child: Text(l, style: const TextStyle(fontSize: 10, color: Colors.white70)));
}
