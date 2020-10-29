import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

final player = AudioCache();

class ImageButton extends StatelessWidget {
  final String image;
  final String audio;
  final String language;
  ImageButton(
      {@required this.language, @required this.image, @required this.audio});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Image(
        image: AssetImage('assets/images/' + image),
      ),
      onPressed: () => {
        player.play('general_audio/' + language + '_Want.mp3'),
        Future.delayed(
          Duration(milliseconds: language == 'English' ? 800 : 1000),
          () {
            player.play('image_audio/' + language + '/' + language + audio);
          },
        ),
        showDialog(
          context: context,
          child: SimpleDialog(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage('assets/images/' + image),
                ),
              )
            ],
          ),
        )
      },
    );
  }
}
