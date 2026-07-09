import '../app_theme.dart';
class HeiseiClassicTheme {
  HeiseiClassicTheme._();
  static const data = AppThemeData(
    id: 'heisei_classic', name: '平成经典', description: '多形态变换 · 炫彩渐变 · 科技感',
    previewImagePath: 'assets/images/themes/heisei_preview.png',
    colors: ThemeColors(primary: Color(0xFF7B2FFF), secondary: Color(0xFFFF0000), background: Color(0xFF12122A),
      surface: Color(0xFF1E1E3A), accent: Color(0xFFFFD700), textPrimary: Color(0xFFFFFFFF),
      textSecondary: Color(0xFFAAAAAA), glow: Color(0xFF7B2FFF)),
    typography: ThemeTypography(titleFontFamily: 'Rajdhani', accentFontFamily: 'Orbitron'),
    hasParticleEffect: true,
  );
}
