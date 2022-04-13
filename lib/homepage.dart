import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as s2t;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  s2t.SpeechToText _speechToText = s2t.SpeechToText(); // s2t object
  bool _speechEnabled = false;
  String _transcription = ''; // Captured transcription

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// Happens once per app
  /// Initialises speechToText functionality
  /// async cos requires internet
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Ran each time to start a speech-to-text session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Stops the speech recognition session
  ///
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _transcription = result.recognizedWords;
    });
  }

  /// Performs transcription
  /// Requires internet connection therefore needs async
  // void listen() async {
  //   if (!_speechEnabled) {
  //     // if true
  //     bool available = await _speechToText.initialize(
  //       onStatus: (status) => print("$status"),
  //       onError: (errorNotification) => print("$errorNotification"),
  //     );
  //     if (available) {
  //       setState(() {
  //         //resets state
  //         _speechEnabled = true;
  //       });
  //       _speechToText.listen(
  //         onResult: (result) => setState(() {
  //           transcription =
  //               result.recognizedWords; // recognised words stored and displayed
  //         }), // this is our text
  //       );
  //     }
  //   } else {
  //     setState(() {
  //       _speechEnabled = false;
  //     });
  //     _speechToText.stop();
  //   }
  // }

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
              // transcription, //It's better to initialise Strings outside widgets
              _speechToText.isListening
                  ? '$_transcription'
                  // If listening isn't active but could be tell the user
                  // how to start it, otherwise indicate that speech
                  // recognition is not yet ready or not supported on
                  // the target device
                  : _speechEnabled
                      ? 'Tap the microphone to start the journal 💛'
                      : 'Speech currently unavailable. Check mic permissions & internet connection and try again.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            // If not yet listening for speech start, otherwise stop
            _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: AvatarGlow(
      //   // fAB wrapped with AvatarGlow widget
      //   // Before child we're specifying AvatarGlow settings
      //   animate: _speechEnabled,
      //   repeat: true,
      //   endRadius: 80,
      //   glowColor: Colors.pink,
      //   duration: Duration(milliseconds: 1000),
      //   child: FloatingActionButton(
      //     onPressed: _speechToText.isNotListening
      //         ? _startListening()
      //         : _stopListening(),
      //     tooltip: 'Listen',
      //     child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),

      //     // // the mic itself :D
      //     // onPressed: () {
      //     //   listen(); // method which listens to user ready for speech to text
      //     // },
      //     // child: Icon(_speechEnabled
      //     //     ? Icons.mic
      //     //     : Icons
      //     //         .mic_none), // if true (islistening) mic on, if false mic off
      //   ),
      // ),
    );
  }
}
