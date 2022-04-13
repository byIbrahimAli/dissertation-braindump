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
  String _transcription =
      'Tap the microphone to start the journal 💛'; // Captured transcription

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// Happens once per app
  /// Initialises speechToText functionality
  /// async cos requires internet
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize(
      // onStatus & onError added to help with debugging for any issues
      onStatus: (status) => print("$status"),
      onError: (errorNotification) => print("$errorNotification"),
    );
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

  /// Called if listening
  /// saves recognised words under _transcription
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _transcription = result.recognizedWords;
    });
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
          child: Text(
            _speechEnabled & _speechToText.isListening
                ? _transcription
                : 'Speech currently unavailable. Check mic permissions & internet connection and try again.',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AvatarGlow(
        animate: _speechToText.isListening,
        repeat: true,
        endRadius: 80,
        glowColor: Colors.pink,
        duration: Duration(milliseconds: 1000),
        child: FloatingActionButton(
          onPressed:
              // If not yet listening for speech start, otherwise stop
              _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: 'Listen',
          child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
        ),
      ),
    );
  }
}
