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
  final int durationSeconds;

  const SoundEffect({
    required this.id, required this.name, required this.riderId,
    this.formId, required this.category, required this.assetPath,
    this.remoteUrl, this.isBuiltIn = true, this.durationSeconds = 5,
  });
}
