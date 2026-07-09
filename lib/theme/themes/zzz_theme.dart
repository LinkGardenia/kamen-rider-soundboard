import 'package:flutter/material.dart';
import '../app_theme.dart';
class ZZZTheme {
  ZZZTheme._();
  static const data = AppThemeData(
    id: 'zzz_retro', name: 'ZZZ 复古潮流', description: '绝区零风格 · 街头涂鸦 · CRT电视美学',
    previewImagePath: 'assets/images/themes/zzz_preview.png',
    colors: ThemeColors(primary: Color(0xFFFF6B35), secondary: Color(0xFF00D4FF), background: Color(0xFF1A1A2E),
      surface: Color(0xFF252540), accent: Color(0xFFFFE030), textPrimary: Color(0xFFFFFFFF),
      textSecondary: Color(0xFFB0B0C0), glow: Color(0xFFFF6B35)),
    typography: ThemeTypography(titleFontFamily: 'Impact', accentFontFamily: 'RussoOne', titleSize: 30, bodySize: 14),
    hasCRTEffect: true, hasGlitchEffect: true,
  );
}
