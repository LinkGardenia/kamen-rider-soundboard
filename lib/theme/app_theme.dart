import 'package:flutter/material.dart';

class ThemeColors {
  final Color primary, secondary, background, surface, accent, textPrimary, textSecondary, glow;
  const ThemeColors({
    required this.primary, required this.secondary, required this.background,
    required this.surface, required this.accent, required this.textPrimary,
    required this.textSecondary, required this.glow,
  });
}

class ThemeTypography {
  final String titleFontFamily, bodyFontFamily, accentFontFamily;
  final double titleSize, bodySize;
  const ThemeTypography({
    this.titleFontFamily = 'Impact', this.bodyFontFamily = 'NotoSansSC',
    this.accentFontFamily = 'RussoOne', this.titleSize = 28, this.bodySize = 14,
  });
}

class AppThemeData {
  final String id, name, description, previewImagePath;
  final ThemeColors colors;
  final ThemeTypography typography;
  final bool hasCRTEffect, hasGlitchEffect, hasParticleEffect;

  const AppThemeData({
    required this.id, required this.name, required this.description,
    required this.previewImagePath, required this.colors, required this.typography,
    this.hasCRTEffect = false, this.hasGlitchEffect = false, this.hasParticleEffect = false,
  });

  ThemeData toMaterialTheme() => ThemeData(
    brightness: Brightness.dark,
    primaryColor: colors.primary,
    scaffoldBackgroundColor: colors.background,
    colorScheme: ColorScheme.dark(primary: colors.primary, secondary: colors.secondary, surface: colors.surface),
    cardTheme: CardThemeData(color: colors.surface, elevation: 8, shadowColor: colors.glow.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colors.accent.withOpacity(0.3), width: 1.5))),
    appBarTheme: AppBarTheme(backgroundColor: colors.background, elevation: 0, centerTitle: true),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontFamily: typography.titleFontFamily, fontSize: typography.titleSize, color: colors.textPrimary),
      bodyMedium: TextStyle(fontFamily: typography.bodyFontFamily, fontSize: typography.bodySize, color: colors.textSecondary),
    ),
    fontFamily: typography.bodyFontFamily,
  );
}
