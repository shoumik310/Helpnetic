import 'package:flutter/material.dart';
import 'package:helpnetic/components/rounded_button.dart';
import 'package:helpnetic/pages/emoji_screen.dart';
import 'package:helpnetic/pages/image_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_circular_text/circular_text.dart';

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
    final width = MediaQuery.of(context).size.width;
    List<String> languages = ['English', 'हिंदी'];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () async {
                  final _prefs = await SharedPreferences.getInstance();
                  _prefs.setInt('index', language);
                  _prefs.setString('language', languages[language]);
                  Navigator.pushNamed(context, ImageScreen.id);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: width / 6,
                      backgroundImage: AssetImage('assets/images/Apple.jpg'),
                    ),
                    CircularText(
                      radius: width / 4,
                      children: [
                        TextItem(
                          text: Text(
                            "Picture Mode".toUpperCase(),
                            style: TextStyle(
                              fontSize: 28,
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
              ),
              SizedBox(
                width: width / 3,
              )
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width / 3,
              ),
              FlatButton(
                onPressed: () async {
                  final _prefs = await SharedPreferences.getInstance();
                  _prefs.setInt('index', language);
                  _prefs.setString('language', languages[language]);
                  Navigator.pushNamed(context, EmojiScreen.id);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: width / 6,
                      backgroundImage: AssetImage('assets/images/Smile.png'),
                    ),
                    CircularText(
                      radius: width / 4,
                      children: [
                        TextItem(
                          text: Text(
                            "Emoji Mode".toUpperCase(),
                            style: TextStyle(
                              fontSize: 28,
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
              ),
            ],
          ),
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
