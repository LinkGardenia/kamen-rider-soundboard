import '../utils/constants.dart';

class SoundEffect {
  final String id;
  final String name;
  final String riderId;
  final String? formId;
  final SoundCategory category;
  final String assetPath;
  final String? remoteUrl;
  final bool isBuiltIn;

  /// 是否为当前所选形态的音效（ZZZ 系列用于音效面板大按钮播放目标）
  final bool isCurrentForm;
  final int durationSeconds;

  const SoundEffect({
    required this.id, required this.name, required this.riderId,
    this.formId, required this.category, required this.assetPath,
    this.remoteUrl, this.isBuiltIn = true, this.isCurrentForm = false, this.durationSeconds = 5,
  });
}
