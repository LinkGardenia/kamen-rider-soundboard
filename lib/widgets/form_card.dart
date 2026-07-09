import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/rider_form.dart';
import '../theme/theme_manager.dart';

class FormCard extends StatelessWidget {
  final RiderForm form; final Color riderColor; final VoidCallback onTap;
  const FormCard({super.key, required this.form, required this.riderColor, required this.onTap});

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    return GestureDetector(onTap: onTap,
      child: Container(decoration: BoxDecoration(color: theme.colors.surface, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: riderColor.withOpacity(0.4), width: 2.5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), offset: const Offset(4, 4), blurRadius: 0),
          BoxShadow(color: riderColor.withOpacity(0.1), blurRadius: 12, offset: const Offset(0, 2))]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(width: 56, height: 56, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: riderColor.withOpacity(0.6), width: 2),
            gradient: RadialGradient(colors: [riderColor.withOpacity(0.2), theme.colors.surface])),
            child: Icon(Icons.auto_awesome, size: 28, color: riderColor)),
          const SizedBox(height: 10),
          Text(form.name, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: theme.typography.accentFontFamily, fontSize: 14, fontWeight: FontWeight.bold, color: theme.colors.textPrimary)),
        ])));
  }
}
