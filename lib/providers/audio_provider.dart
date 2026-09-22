import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/sound_effect.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  String? _activeId;
  bool _playing = false;
  String? get activeSoundId => _activeId;
  bool get isPlaying => _playing;

  AudioProvider() {
    _player.onPlayerStateChanged.listen((s) {
      _playing = s == PlayerState.playing;
      if (s == PlayerState.completed) _activeId = null;
      notifyListeners();
    });
  }

  Future<void> play(SoundEffect sound) async {
    if (_activeId == sound.id && _playing) { await stop(); return; }
    await _player.stop();
    _activeId = sound.id;
    notifyListeners();
    // 先按配置路径播放，失败时自动尝试另一格式（mp3 ↔ wav）
    final played = await _tryPlay(sound.assetPath) || await _tryPlay(_altFormat(sound.assetPath));
    if (!played) {
      debugPrint('Play failed: ${sound.assetPath}');
      _activeId = null; notifyListeners();
    }
  }

  /// 尝试播放指定资源，失败返回 false
  Future<bool> _tryPlay(String path) async {
    try {
      // audioplayers 的 AssetSource 会自动加 "assets/" 前缀，这里去掉路径中重复的前缀
      final key = path.startsWith('assets/') ? path.substring(7) : path;
      await _player.play(AssetSource(key));
      return true;
    } catch (e) { debugPrint('TryPlay failed: $path -> $e'); return false; }
  }

  /// mp3 ↔ wav 路径互转，便于直接使用现成的 wav 音效素材
  String _altFormat(String path) {
    if (path.endsWith('.mp3')) return '${path.substring(0, path.length - 4)}.wav';
    if (path.endsWith('.wav')) return '${path.substring(0, path.length - 4)}.mp3';
    return '$path.wav';
  }

  Future<void> stop() async {
    await _player.stop(); _activeId = null; _playing = false; notifyListeners();
  }

  @override void dispose() { _player.dispose(); super.dispose(); }
}
