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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Image(
            color: Colors.white,
            image: AssetImage('assets/images/Helpnetic.png'),
          ),
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
                      radius: width / 7,
                      backgroundImage: AssetImage('assets/images/Apple.jpg'),
                    ),
                    CircularText(
                      radius: width / 5,
                      children: [
                        TextItem(
                          text: Text(
                            "Picture Mode".toUpperCase(),
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
              ),
              SizedBox(
                width: width / 25,
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
                      radius: width / 7,
                      backgroundImage: AssetImage('assets/images/Smile.png'),
                    ),
                    CircularText(
                      radius: width / 5,
                      children: [
                        TextItem(
                          text: Text(
                            "Emoji Mode".toUpperCase(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          space: 13,
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
          Center(
            child: ToggleSwitch(
              minWidth: 3 * width / 4,
              minHeight: 90.0,
              fontSize: 35.0,
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
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
