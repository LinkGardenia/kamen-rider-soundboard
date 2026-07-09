import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/rider.dart';
import '../../models/rider_form.dart';
import '../../data/sound_repository.dart';
import '../../theme/theme_manager.dart';
import '../../providers/audio_provider.dart';
import '../../utils/constants.dart';
import '../../widgets/zzz_capsule_button.dart';
import '../../widgets/crt_overlay.dart';

class SoundBoardScreen extends StatefulWidget {
  final KamenRider rider;
  final RiderForm selectedForm;
  const SoundBoardScreen({super.key, required this.rider, required this.selectedForm});
  @override State<SoundBoardScreen> createState() => _SoundBoardScreenState();
}

class _SoundBoardScreenState extends State<SoundBoardScreen> {
  SoundCategory _cat = SoundCategory.henshin;

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    final ap = context.watch<AudioProvider>();
    final c = Color(int.parse('0xFF${widget.rider.colorHex.substring(1)}'));
    final all = SoundRepository.getSounds(widget.rider.id, widget.selectedForm.id);
    final filtered = all.where((s) => s.category == _cat).toList();
    final henshin = all.where((s) => s.category == SoundCategory.henshin).firstOrNull;

    return Scaffold(backgroundColor: theme.colors.background,
      appBar: AppBar(title: Text(widget.rider.name, style: TextStyle(fontFamily: theme.typography.accentFontFamily, fontSize: 18, color: theme.colors.accent)), backgroundColor: theme.colors.background, elevation: 0,
        bottom: PreferredSize(preferredSize: const Size.fromHeight(3), child: Container(color: c, height: 3))),
      body: Stack(children: [
        Column(children: [
          Container(height: 160, decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [c.withOpacity(0.3), theme.colors.background])),
            child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.auto_awesome, size: 48, color: c.withOpacity(0.6)), const SizedBox(height: 8), Text(widget.selectedForm.name, style: TextStyle(fontFamily: theme.typography.titleFontFamily, fontSize: 22, fontWeight: FontWeight.w900, color: c))]))),
          if (henshin != null) Padding(padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12), child: SizedBox(width: double.infinity, height: 72,
            child: ZZZCapsuleButton(label: '变身！HENSHIN!', subLabel: widget.selectedForm.name, iconEmoji: '🔥', accentColor: c, isActive: ap.activeSoundId == henshin.id, isHenshin: true, onPressed: () => ap.play(henshin)))),
          SizedBox(height: 44, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), children: SoundCategory.values.map((cat) {
            final sel = _cat == cat;
            return Padding(padding: const EdgeInsets.only(right: 8), child: GestureDetector(onTap: () => setState(() => _cat = cat), child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), decoration: BoxDecoration(color: sel ? c.withOpacity(0.25) : theme.colors.surface, borderRadius: BorderRadius.circular(22), border: Border.all(color: sel ? c : c.withOpacity(0.3), width: sel ? 2.5 : 1.5)), child: Text(cat.label, style: TextStyle(color: sel ? Colors.white : theme.colors.textSecondary, fontWeight: sel ? FontWeight.bold : FontWeight.normal, fontSize: 12)))));
          }).toList())),
          const SizedBox(height: 8),
          Expanded(child: filtered.isEmpty ? Center(child: Text('该分类暂无音效', style: TextStyle(color: theme.colors.textSecondary))) : GridView.builder(padding: const EdgeInsets.symmetric(horizontal: 16), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.95), itemCount: filtered.length, itemBuilder: (ctx, i) {
            final s = filtered[i];
            return ZZZCapsuleButton(label: s.name, iconEmoji: s.category.emoji, accentColor: c, isActive: ap.activeSoundId == s.id, onPressed: () => ap.play(s));
          })),
        ]),
        if (theme.hasCRTEffect) const CRTOverlay(),
      ]));
  }
}
