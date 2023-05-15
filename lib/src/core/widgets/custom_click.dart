import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CustomClick extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  final audioPlayer = AudioPlayer();
  final navSound;
  final soundPath;
  final navSoundPath = 'audio/light-switch.mp3';
  final volume;

  CustomClick({
    this.onTap,
    this.child,
    this.navSound = true,
    this.soundPath = 'audio/light-switch.mp3',
    this.volume = 0.2,
    Key? key,
  }) : super(key: key);

  playNavigationSound(String sound) async {
    await audioPlayer.play(
      AssetSource(sound),
      volume: volume,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // if (navSound) {
        //   await playNavigationSound(navSoundPath);
        // }
        // if (soundPath != null) {
        //   playNavigationSound(soundPath);
        // }

        if (onTap != null) {
          onTap!();
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: child,
    );
  }
}
