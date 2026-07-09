import '../app_theme.dart';
class ReiwaFutureTheme {
  ReiwaFutureTheme._();
  static const data = AppThemeData(
    id: 'reiwa_future', name: '令和未来', description: '极简科技 · 全息HUD · Zero-One风格',
    previewImagePath: 'assets/images/themes/reiwa_preview.png',
    colors: ThemeColors(primary: Color(0xFFFFEB3B), secondary: Color(0xFF00E5FF), background: Color(0xFF000510),
      surface: Color(0xFF0D1B2A), accent: Color(0xFFFF1744), textPrimary: Color(0xFFE0F7FA),
      textSecondary: Color(0xFF78909C), glow: Color(0xFFFFEB3B)),
    typography: ThemeTypography(titleFontFamily: 'Exo2', accentFontFamily: 'ShareTechMono'),
    hasParticleEffect: true,
  );
}
