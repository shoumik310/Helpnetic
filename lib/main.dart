import 'package:flutter/material.dart';
import 'package:helpnetic/pages/emoji_screen.dart';
import 'package:helpnetic/pages/home_screen.dart';
import 'package:helpnetic/pages/image_screen.dart';

void main() {
  runApp(Helpnetic());
}

class Helpnetic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        EmojiScreen.id: (context) => EmojiScreen(),
        ImageScreen.id: (context) => ImageScreen(),
      },
    );
  }
}
