import 'package:flutter/material.dart';
import '../components/emoji_button.dart';
import '../components/top_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> _getLanguage() async {
  final _prefs = await SharedPreferences.getInstance();
  return _prefs.getString('language');
}

class EmojiScreen extends StatefulWidget {
  static const String id = "emoji_screen";

  @override
  _EmojiScreenState createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  String language = 'English';
  bool _isDisabled = false;
  @override
  void initState() {
    super.initState();
    _getLanguage().then((result) {
      language = result;
      if (result == 'हिंदी') {
        _isDisabled = true;
      }
      print("result: $result");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            TopButton(
              text: 'I',
              audio: language + '_I.mp3',
            ),
            TopButton(
              text: 'You',
              audio: language + '_You.mp3',
            ),
            TopButton(
              text: '❤',
              audio: 'English_Am_Feeling.mp3',
              isDisabled: _isDisabled,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 7,
            )
          ],
        ),
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                children: <Widget>[
                  EmojiButton(
                    emoji: '😁',
                    audio: '_Happy.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😍',
                    audio: '_Love.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😴',
                    audio: '_Sleepy.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😭',
                    audio: '_Sad.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😡',
                    audio: '_Angry.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😂',
                    audio: '_Funny.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😅',
                    audio: '_Embarrassed.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '🤔',
                    audio: '_Thinking.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '🥺',
                    audio: '_Please.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '🤤',
                    audio: '_Hungry.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😱',
                    audio: '_Scared.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😰',
                    audio: '_Worried.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😵',
                    audio: '_Confused.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '🤢',
                    audio: '_Disgusted.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '🤮',
                    audio: '_Sick.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '🤕',
                    audio: '_Hurt.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '🤥',
                    audio: '_Lie.mp3',
                    language: language,
                  ),
                  EmojiButton(
                    emoji: '😇',
                    audio: '_Truth.mp3',
                    language: language,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
