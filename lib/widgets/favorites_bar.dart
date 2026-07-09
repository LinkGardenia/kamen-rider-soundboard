import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/rider.dart';
import '../models/tv_series.dart';
import '../theme/theme_manager.dart';
import '../screens/system/form_select_screen.dart';

class FavoritesBar extends StatelessWidget {
  final List<KamenRider> favorites;
  const FavoritesBar({super.key, required this.favorites});

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    return SizedBox(height: 100, child: ListView.separated(scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16), itemCount: favorites.length,
      separatorBuilder: (_, __) => const SizedBox(width: 12),
      itemBuilder: (ctx, i) {
        final rider = favorites[i]; final c = Color(int.parse('0xFF${rider.colorHex.substring(1)}'));
        return GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FormSelectScreen(rider: rider))),
          child: Container(width: 80, decoration: BoxDecoration(color: theme.colors.surface, borderRadius: BorderRadius.circular(16),
            border: Border.all(color: c, width: 2), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), offset: const Offset(2, 2), blurRadius: 0)]),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(width: 48, height: 48, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: c, width: 2),
                gradient: RadialGradient(colors: [c.withOpacity(0.3), theme.colors.surface])), child: Icon(Icons.star, size: 24, color: c)),
              const SizedBox(height: 6),
              Text(rider.name.length > 6 ? '${rider.name.substring(0, 6)}...' : rider.name, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis,
                style: TextStyle(color: theme.colors.textPrimary, fontSize: 10, fontWeight: FontWeight.bold)),
            ])));
      }));
  }
}
