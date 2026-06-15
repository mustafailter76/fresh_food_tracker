import 'package:audioplayers/audioplayers.dart';

class SoundService {
  SoundService._();

  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playEat() async {
    try {
      await _player.play(AssetSource('sounds/eat.mp3'));
    } catch (_) {}
  }

  static Future<void> playTrash() async {
    try {
      await _player.play(AssetSource('sounds/trash.mp3'));
    } catch (_) {}
  }
}
