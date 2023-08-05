import 'package:just_audio/just_audio.dart';

import '../main.dart';

enum AudioType { url, asset, file }

class AppAudio {
  final String path;
  final String? name;

  AppAudio({required this.path, this.name});

  AudioType get type {
    if (path.startsWith("http")) return AudioType.url;
    if (path.startsWith("assets")) return AudioType.asset;
    return AudioType.file;
  }

  void play() {
    if (player.playing) {
      player.stop();
      return;
    }

    switch (type) {
      case AudioType.url:
        player.setUrl(path);
        break;
      case AudioType.asset:
        player.setAsset(path);
        break;
      case AudioType.file:
        player.setFilePath(path);
        break;
    }
    player.play();
  }
}
