import '../app_theme.dart';
class ShowaRetroTheme {
  ShowaRetroTheme._();
  static const data = AppThemeData(
    id: 'showa_retro', name: '昭和复古', description: '经典特摄 · 颗粒胶片 · 怀旧质感',
    previewImagePath: 'assets/images/themes/showa_preview.png',
    colors: ThemeColors(primary: Color(0xFFCC0000), secondary: Color(0xFFFFD700), background: Color(0xFF1C1816),
      surface: Color(0xFF2A2420), accent: Color(0xFFFF4444), textPrimary: Color(0xFFFFF8E7),
      textSecondary: Color(0xFFB8A898), glow: Color(0xFFFFD700)),
    typography: ThemeTypography(titleFontFamily: 'NotoSerifSC', accentFontFamily: 'NotoSerifSC'),
  );
}
