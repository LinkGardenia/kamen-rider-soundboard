/// 全局常量
class AppConstants {
  AppConstants._();
  static const String appName = '假面骑士音效板';
  static const String appVersion = '1.0.0';
  static const String keyCurrentTheme = 'current_theme';
  static const String keyFavorites = 'favorite_riders';
}

enum SoundCategory { henshin, hissatsu, weapon, formChange, lines, belt, bgm, other }

extension SoundCategoryX on SoundCategory {
  String get label {
    switch (this) {
      case SoundCategory.henshin: return '变身';
      case SoundCategory.hissatsu: return '必杀';
      case SoundCategory.weapon: return '武器';
      case SoundCategory.formChange: return '换形态';
      case SoundCategory.lines: return '台词';
      case SoundCategory.belt: return '腰带';
      case SoundCategory.bgm: return 'BGM';
      case SoundCategory.other: return '其他';
    }
  }
  String get emoji {
    switch (this) {
      case SoundCategory.henshin: return '🔥';
      case SoundCategory.hissatsu: return '💥';
      case SoundCategory.weapon: return '⚔️';
      case SoundCategory.formChange: return '🔄';
      case SoundCategory.lines: return '💬';
      case SoundCategory.belt: return '🔧';
      case SoundCategory.bgm: return '🎶';
      case SoundCategory.other: return '📢';
    }
  }
}
