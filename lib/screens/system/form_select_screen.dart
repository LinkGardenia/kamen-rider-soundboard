import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/rider.dart';
import '../../theme/theme_manager.dart';
import '../../providers/favorites_provider.dart';
import '../../widgets/form_card.dart';
import '../../widgets/crt_overlay.dart';
import 'sound_board_screen.dart';

class FormSelectScreen extends StatelessWidget {
  final KamenRider rider;
  const FormSelectScreen({super.key, required this.rider});

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    final c = Color(int.parse('0xFF${rider.colorHex.substring(1)}'));
    final favs = context.read<FavoritesProvider>();
    return Scaffold(backgroundColor: theme.colors.background,
      appBar: AppBar(title: Text(rider.name, style: TextStyle(fontFamily: theme.typography.titleFontFamily, fontSize: 20, color: theme.colors.accent)), backgroundColor: theme.colors.background, elevation: 0,
        bottom: PreferredSize(preferredSize: const Size.fromHeight(3), child: Container(color: c, height: 3))),
      body: Stack(children: [
        Column(children: [
          Container(height: 180, margin: const EdgeInsets.all(16), decoration: BoxDecoration(color: theme.colors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: c.withOpacity(0.5), width: 2), boxShadow: [BoxShadow(color: c.withOpacity(0.2), blurRadius: 20, offset: const Offset(4, 4))]),
            child: Stack(children: [
              Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.person, size: 64, color: c.withOpacity(0.6)), const SizedBox(height: 8), Text(rider.name, style: TextStyle(fontFamily: theme.typography.accentFontFamily, fontSize: 20, fontWeight: FontWeight.bold, color: theme.colors.textPrimary))])),
              Positioned(top: 8, right: 8, child: GestureDetector(onTap: () => favs.toggleFavorite(rider.id), child: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: theme.colors.surface, shape: BoxShape.circle, border: Border.all(color: c, width: 2)), child: Icon(favs.isFavorite(rider.id) ? Icons.star : Icons.star_border, color: favs.isFavorite(rider.id) ? c : theme.colors.textSecondary, size: 24)))),
            ])),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Align(alignment: Alignment.centerLeft, child: Text('选择形态', style: TextStyle(fontFamily: theme.typography.accentFontFamily, fontSize: 18, color: theme.colors.accent, fontWeight: FontWeight.bold)))),
          const SizedBox(height: 12),
          Expanded(child: GridView.builder(padding: const EdgeInsets.symmetric(horizontal: 16), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.1, crossAxisSpacing: 12, mainAxisSpacing: 12), itemCount: rider.forms.length, itemBuilder: (ctx, i) => FormCard(form: rider.forms[i], riderColor: c, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SoundBoardScreen(rider: rider, selectedForm: rider.forms[i]))))))),
        ]),
        if (theme.hasCRTEffect) const CRTOverlay(),
      ]));
  }
}
