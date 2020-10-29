import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

final player = AudioCache();

class TopButton extends StatelessWidget {
  final String text;
  final String audio;
  final bool isDisabled;
  TopButton(
      {this.isDisabled = false, @required this.text, @required this.audio});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 45,
          ),
        ),
        onPressed: isDisabled
            ? null
            : () {
                player.play('general_audio/' + audio);
              });
  }
}
