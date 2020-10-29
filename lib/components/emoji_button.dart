import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

final player = AudioCache();

class EmojiButton extends StatelessWidget {
  final emoji;
  final String audio;
  final String language;
  EmojiButton(
      {@required this.language, @required this.emoji, @required this.audio});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          emoji,
          style: TextStyle(
            fontSize: 75,
          ),
        ),
        onPressed: () {
          player.play('emoji_audio/' + language + '/' + language + audio);
        });
  }
}
