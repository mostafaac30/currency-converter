import 'package:audioplayers/audioplayers.dart';

import '../../injector.dart';

class SoundHandler {
  final bgAudio = sl<AudioPlayer>();

  static final _singleton = SoundHandler._internal();
  factory SoundHandler() {
    return _singleton;
  }
  SoundHandler._internal();
  PlayerState get state => bgAudio.state;
  Future<void> stopBackgroundMusic() async {
    await bgAudio.stop();
    await bgAudio.dispose();
  }

  void playBackgroundMusic() {
    bgAudio.play(
      AssetSource('audio/background.mp3'),
    );
    bgAudio.onPlayerComplete.listen((event) {
      bgAudio.play(
        AssetSource('audio/background.mp3'),
        volume: 0.1,
      );
    });
  }
}
