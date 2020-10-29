import 'package:flutter/material.dart';
import 'package:helpnetic/components/rounded_button.dart';
import 'package:helpnetic/pages/emoji_screen.dart';
import 'package:helpnetic/pages/image_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> _getLanguage() async {
  final _prefs = await SharedPreferences.getInstance();
  return _prefs.getInt('index');
}

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int language = 0;
  void initState() {
    super.initState();
    _getLanguage().then(
      (result) {
        if (result != null) {
          language = result;
          print("result: $result");
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> languages = ['English', 'हिंदी'];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundedButton(
            title: "Picture Mode",
            onPressed: () async {
              final _prefs = await SharedPreferences.getInstance();
              _prefs.setInt('index', language);
              _prefs.setString('language', languages[language]);
              Navigator.pushNamed(context, ImageScreen.id);
            },
          ),
          RoundedButton(
            title: "Emoji Mode",
            onPressed: () async {
              final _prefs = await SharedPreferences.getInstance();
              _prefs.setInt('index', language);
              _prefs.setString('language', languages[language]);
              Navigator.pushNamed(context, EmojiScreen.id);
            },
          ),
          Center(
            child: ToggleSwitch(
              activeBgColor: Colors.white,
              inactiveBgColor: Colors.black,
              initialLabelIndex: language,
              labels: languages,
              onToggle: (index) {
                language = index;
                print('Switched to: $language');
              },
            ),
          ),
        ],
      ),
    );
  }
}
