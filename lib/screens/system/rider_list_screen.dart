import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/tv_series.dart';
import '../../theme/theme_manager.dart';
import '../../widgets/rider_card.dart';

class RiderListScreen extends StatelessWidget {
  final TVSeries series;
  const RiderListScreen({super.key, required this.series});

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    final c = Color(int.parse('0xFF${series.themeColorHex.substring(1)}'));
    return Scaffold(appBar: AppBar(title: Text(series.title, style: TextStyle(fontFamily: theme.typography.titleFontFamily, fontSize: 22, color: theme.colors.accent)), backgroundColor: theme.colors.background, elevation: 0,
      bottom: PreferredSize(preferredSize: const Size.fromHeight(3), child: Container(color: c, height: 3))),
      body: Column(children: [
        Container(padding: const EdgeInsets.all(16), child: Row(children: [
          Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: c.withOpacity(0.2), borderRadius: BorderRadius.circular(20), border: Border.all(color: c.withOpacity(0.5), width: 2)), child: Text('${series.era} · ${series.yearRange}', style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 13))),
          const Spacer(), Text('${series.riders.length} 位骑士', style: TextStyle(color: theme.colors.textSecondary, fontSize: 13))])),
        Expanded(child: GridView.builder(padding: const EdgeInsets.symmetric(horizontal: 16), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 12, mainAxisSpacing: 12), itemCount: series.riders.length, itemBuilder: (ctx, i) => RiderCard(rider: series.riders[i]))),
      ]));
  }
}
