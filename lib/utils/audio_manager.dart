import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();
  final AudioPlayer _bgm = AudioPlayer();
  Future<void> playBGM(String path) async {
    await _bgm.stop(); await _bgm.play(AssetSource(path));
    await _bgm.setReleaseMode(ReleaseMode.loop);
  }
  Future<void> stopBGM() async => await _bgm.stop();
  void dispose() => _bgm.dispose();
}
