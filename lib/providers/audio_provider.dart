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
    try {
      await _player.play(AssetSource(sound.assetPath));
    } catch (e) {
      debugPrint('Play failed: $e');
      _activeId = null; notifyListeners();
    }
  }

  Future<void> stop() async {
    await _player.stop(); _activeId = null; _playing = false; notifyListeners();
  }

  @override void dispose() { _player.dispose(); super.dispose(); }
}
