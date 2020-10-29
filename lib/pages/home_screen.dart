import 'package:flutter/material.dart';
import 'package:helpnetic/pages/image_screen.dart';
import 'package:helpnetic/pages/emoji_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_circular_text/circular_text.dart';
import '../components/rit_button.dart';

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
              RITButton(
                  text: "Picture Mode",
                  image: "Apple.jpg",
                  onPressed: () async {
                    final _prefs = await SharedPreferences.getInstance();
                    _prefs.setInt('index', language);
                    _prefs.setString('language', languages[language]);
                    Navigator.pushNamed(context, ImageScreen.id);
                  },
                  language: language,
                  languages: languages,
                  width: width),
              SizedBox(
                width: width / 25,
              ),
              RITButton(
                  text: "Emoji Mode",
                  image: "Smile.png",
                  onPressed: () async {
                    final _prefs = await SharedPreferences.getInstance();
                    _prefs.setInt('index', language);
                    _prefs.setString('language', languages[language]);
                    Navigator.pushNamed(context, EmojiScreen.id);
                  },
                  language: language,
                  languages: languages,
                  width: width),
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
