import '../app_theme.dart';
class NeoCyberTheme {
  NeoCyberTheme._();
  static const data = AppThemeData(
    id: 'neo_cyber', name: '赛博朋克', description: '霓虹灯管 · 全息投影 · 数据流',
    previewImagePath: 'assets/images/themes/cyber_preview.png',
    colors: ThemeColors(primary: Color(0xFF00FF88), secondary: Color(0xFFFF00FF), background: Color(0xFF0A0A0A),
      surface: Color(0xFF1A1A1A), accent: Color(0xFF00FFFF), textPrimary: Color(0xFFFFFFFF),
      textSecondary: Color(0xFF888888), glow: Color(0xFF00FF88)),
    typography: ThemeTypography(titleFontFamily: 'Orbitron', accentFontFamily: 'ShareTechMono'),
    hasGlitchEffect: true, hasParticleEffect: true,
  );
}
