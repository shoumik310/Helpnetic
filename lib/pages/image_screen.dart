import 'package:flutter/material.dart';
import '../components/image_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

String language = 'English';
bool _isDisabled = false;
Future<String> _getLanguage() async {
  final _prefs = await SharedPreferences.getInstance();
  return _prefs.getString('language');
}

class ImageScreen extends StatefulWidget {
  static const String id = "picture_screen";

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  void initState() {
    super.initState();
    _getLanguage().then((result) {
      language = result;
      print("result: $result");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                children: <Widget>[
                  ImageButton(
                    image: 'Car.jpg',
                    audio: '_Car.mp3',
                    language: language,
                  ),
                  ImageButton(
                    image: 'Apple.jpg',
                    audio: '_Apple.mp3',
                    language: language,
                  ),
                  ImageButton(
                    image: 'Chocolate.jpg',
                    audio: '_Chocolate.mp3',
                    language: language,
                  ),
                  ImageButton(
                    image: 'Play.jpg',
                    audio: '_Play.mp3',
                    language: language,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
