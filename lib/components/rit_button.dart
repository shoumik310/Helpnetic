import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helpnetic/pages/image_screen.dart';
import 'package:helpnetic/pages/emoji_screen.dart';

class RITButton extends StatelessWidget {
  RITButton({
    @required this.image,
    @required this.text,
    @required this.onPressed,
    @required this.language,
    @required this.languages,
    @required this.width,
  });

  final String image;
  final String text;
  final Function onPressed;
  final int language;
  final List<String> languages;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: width / 7,
            backgroundImage: AssetImage('assets/images/$image'),
          ),
          CircularText(
            radius: width / 5,
            children: [
              TextItem(
                text: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                space: 12,
                startAngle: -90,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
