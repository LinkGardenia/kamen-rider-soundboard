import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/rider.dart';
import '../theme/theme_manager.dart';
import '../screens/system/form_select_screen.dart';

class RiderCard extends StatelessWidget {
  final KamenRider rider;
  const RiderCard({super.key, required this.rider});

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    final c = Color(int.parse('0xFF${rider.colorHex.substring(1)}'));
    return GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FormSelectScreen(rider: rider))),
      child: Container(decoration: BoxDecoration(color: theme.colors.surface, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.withOpacity(0.5), width: 2),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), offset: const Offset(3, 3), blurRadius: 0)]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(width: 64, height: 64, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: c, width: 3),
            gradient: RadialGradient(colors: [c.withOpacity(0.3), theme.colors.surface])),
            child: Icon(Icons.person, size: 36, color: c)),
          const SizedBox(height: 12),
          Text(rider.name, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: theme.typography.accentFontFamily, fontSize: 14, fontWeight: FontWeight.bold, color: theme.colors.textPrimary)),
          const SizedBox(height: 4),
          Text('${rider.forms.length}种形态', style: TextStyle(fontSize: 11, color: theme.colors.textSecondary)),
        ])));
  }
}
