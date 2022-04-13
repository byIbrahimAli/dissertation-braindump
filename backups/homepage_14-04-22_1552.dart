import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as s2t;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //!!cleared
  s2t.SpeechToText speechToText = s2t.SpeechToText(); // s2t object
  bool isListening = false; // defalt animation off without button press
  String textbox = "Tap the mic button to start your journal!";

  /// Performs transcription
  /// Requires internet connection therefore needs async
  void listen() async {
    if (!isListening) {
      // if true
      bool available = await speechToText.initialize(
        onStatus: (status) => print("$status"),
        onError: (errorNotification) => print("$errorNotification"),
      );
      if (available) {
        setState(() {
          //resets state
          isListening = true;
        });
        speechToText.listen(
          onResult: (result) => setState(() {
            textbox =
                result.recognizedWords; // recognised words stored and displayed
          }), // this is our text
        );
      }
    } else {
      setState(() {
        isListening = false;
      });
      speechToText.stop();
    }
  }

  //!!cleared
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    speechToText = s2t.SpeechToText(); // starts s2t service
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**
       * Container: Black screen -- completely starting from scratch
       * Scaffold: Acts as a framework, title bar, white background, ... :D
       */
      appBar: AppBar(
        title: Text(
          "🤯 Record Journal",
          style: TextStyle(
            // Making the title (appbar) clearer and bolder
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true, // Center alignment for contents in AppBar
      ),
      body: SingleChildScrollView(
        // Prep for the Speech-To-Text live transcript -- makes container scrollable
        child: Padding(
          padding: const EdgeInsets.all(
              12.0), // wow similar to CSS :D Pads container
          child: Container(
            child: Text(
              textbox, //It's better to initialise Strings outside widgets
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AvatarGlow(
        // fAB wrapped with AvatarGlow widget
        // Before child we're specifying AvatarGlow settings
        animate: isListening,
        repeat: true,
        endRadius: 80,
        glowColor: Colors.pink,
        duration: Duration(milliseconds: 1000),
        child: FloatingActionButton(
          // the mic itself :D
          onPressed: () {
            listen(); // method which listens to user ready for speech to text
          },
          child: Icon(isListening
              ? Icons.mic
              : Icons
                  .mic_none), // if true (islistening) mic on, if false mic off
        ),
      ),
    );
  }
}
