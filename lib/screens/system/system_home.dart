import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_manager.dart';
import '../../data/sound_repository.dart';
import '../../providers/favorites_provider.dart';
import '../../widgets/series_card.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/favorites_bar.dart';
import '../../widgets/crt_overlay.dart';

class SystemHome extends StatefulWidget {
  const SystemHome({super.key});
  @override State<SystemHome> createState() => _SystemHomeState();
}

class _SystemHomeState extends State<SystemHome> {
  String _era = '全部';

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    final favs = context.watch<FavoritesProvider>().favoriteRiders;
    final all = _era == '全部' ? SoundRepository.getAllSeries() : SoundRepository.getAllSeries().where((s) => s.era == _era).toList();

    return Stack(children: [
      CustomScrollView(slivers: [
        SliverAppBar(pinned: true, expandedHeight: 120, backgroundColor: theme.colors.background,
          flexibleSpace: FlexibleSpaceBar(title: Text('假面骑士系统', style: TextStyle(fontFamily: theme.typography.titleFontFamily, fontSize: 26, fontWeight: FontWeight.w900, color: theme.colors.accent, letterSpacing: 2, shadows: [Shadow(color: theme.colors.accent.withOpacity(0.6), blurRadius: 12)])), centerTitle: true, titlePadding: const EdgeInsets.only(bottom: 16))),
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: const RiderSearchBar())),
        if (favs.isNotEmpty) SliverToBoxAdapter(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4), child: Text('⭐ 常用骑士', style: TextStyle(fontFamily: theme.typography.accentFontFamily, fontSize: 16, color: theme.colors.accent))),
          const SizedBox(height: 4), FavoritesBar(favorites: favs), const SizedBox(height: 8)])),
        SliverToBoxAdapter(child: SizedBox(height: 40, child: ListView.separated(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), itemCount: SoundRepository.eras.length, separatorBuilder: (_, __) => const SizedBox(width: 8), itemBuilder: (ctx, i) {
          final e = SoundRepository.eras[i]; final sel = _era == e;
          return GestureDetector(onTap: () => setState(() => _era = e), child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: sel ? theme.colors.accent.withOpacity(0.25) : theme.colors.surface, borderRadius: BorderRadius.circular(20), border: Border.all(color: sel ? theme.colors.accent : theme.colors.accent.withOpacity(0.3), width: sel ? 2.5 : 1.5)), child: Text(e, style: TextStyle(color: sel ? Colors.white : theme.colors.textSecondary, fontWeight: sel ? FontWeight.bold : FontWeight.normal, fontSize: 13))));
        }))),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 16), sliver: SliverGrid(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.72, crossAxisSpacing: 12, mainAxisSpacing: 12), delegate: SliverChildBuilderDelegate((ctx, i) => SeriesCard(series: all[i]), childCount: all.length))),
        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ]),
      if (theme.hasCRTEffect) const CRTOverlay(),
    ]);
  }
}
