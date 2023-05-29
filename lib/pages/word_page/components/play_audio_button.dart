import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayAudioButton extends StatefulWidget {
  final String audioUrl;
  const PlayAudioButton(this.audioUrl, {super.key});

  @override
  State<PlayAudioButton> createState() => _PlayAudioButtonState();
}

class _PlayAudioButtonState extends State<PlayAudioButton> {
  late final AudioPlayer player;

  Future<void> onPlayTap(String audioUrl) async {
    if (player.playerState.playing) {
      player.stop();
    }
    await player.setUrl(audioUrl);
    player.play();
  }

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => onPlayTap(widget.audioUrl),
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Icon(Icons.volume_up_rounded, color: theme.textTheme.bodyMedium!.color!.withOpacity(.6)),
      ),
    );
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }
}
