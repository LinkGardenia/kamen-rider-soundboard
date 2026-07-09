import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tv_series.dart';
import '../theme/theme_manager.dart';
import '../screens/system/rider_list_screen.dart';

class SeriesCard extends StatelessWidget {
  final TVSeries series;
  const SeriesCard({super.key, required this.series});

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    final c = Color(int.parse('0xFF${series.themeColorHex.substring(1)}'));
    return GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RiderListScreen(series: series))),
      child: Container(decoration: BoxDecoration(color: theme.colors.surface, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colors.accent.withOpacity(0.3), width: 2),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), offset: const Offset(4, 4), blurRadius: 0),
          BoxShadow(color: c.withOpacity(0.15), blurRadius: 16, offset: const Offset(0, 4))]),
        clipBehavior: Clip.antiAlias,
        child: Column(children: [
          Expanded(flex: 3, child: Container(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [c.withOpacity(0.3), theme.colors.surface])),
            child: Stack(children: [
              Center(child: Icon(Icons.tv, size: 48, color: c.withOpacity(0.6))),
              Positioned(top: 8, right: 8, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: c.withOpacity(0.8), borderRadius: BorderRadius.circular(8)),
                child: Text(series.era, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)))),
            ]))),
          Expanded(flex: 2, child: Padding(padding: const EdgeInsets.all(10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(series.title, style: TextStyle(fontFamily: theme.typography.accentFontFamily, fontSize: 15, fontWeight: FontWeight.bold, color: theme.colors.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text('${series.yearRange} · ${series.riders.length}位骑士', style: TextStyle(fontSize: 11, color: theme.colors.textSecondary)),
          ]))),
        ])));
  }
}
