import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
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
        child: Container(
          // Prep for the Speech-To-Text live transcript -- makes container scrollable
          child: Padding(
            padding: const EdgeInsets.all(
                12.0), // wow similar to CSS :D Pads container
            child: TextHighlight(
              text: !_speechEnabled & _speechToText.isListening
                  ? 'Speech currently unavailable. Check mic permissions & internet connection and try again.'
                  : _transcription,
              words: _highlights,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 22,
              ),
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

  final Map<String, HighlightedWord> _highlights = {
    'trichtillomania': HighlightedWord(
      onTap: () => print('trichtillomania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'attention deficit w/ hyperactivity': HighlightedWord(
      onTap: () => print('attention deficit w/ hyperactivity'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'attention deflict distorder': HighlightedWord(
      onTap: () => print('attention deflict distorder'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'attn deficit w hyperact': HighlightedWord(
      onTap: () => print('attn deficit w hyperact'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'auspergers': HighlightedWord(
      onTap: () => print('auspergers'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'austism': HighlightedWord(
      onTap: () => print('austism'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'austistic': HighlightedWord(
      onTap: () => print('austistic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'authism': HighlightedWord(
      onTap: () => print('authism'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'authistic': HighlightedWord(
      onTap: () => print('authistic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'autisim': HighlightedWord(
      onTap: () => print('autisim'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'autism': HighlightedWord(
      onTap: () => print('autism'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'autistic': HighlightedWord(
      onTap: () => print('autistic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'attention deficit hyperactivity dis': HighlightedWord(
      onTap: () => print('attention deficit hyperactivity dis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bp1': HighlightedWord(
      onTap: () => print('bp1'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bulemia': HighlightedWord(
      onTap: () => print('bulemia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bulemic': HighlightedWord(
      onTap: () => print('bulemic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bulimea': HighlightedWord(
      onTap: () => print('bulimea'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bullemia': HighlightedWord(
      onTap: () => print('bullemia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'circular insanity': HighlightedWord(
      onTap: () => print('circular insanity'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'combat neurosis': HighlightedWord(
      onTap: () => print('combat neurosis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cyclophrenia': HighlightedWord(
      onTap: () => print('cyclophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cyclophrenic': HighlightedWord(
      onTap: () => print('cyclophrenic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cyclothymia': HighlightedWord(
      onTap: () => print('cyclothymia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bp2': HighlightedWord(
      onTap: () => print('bp2'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'attention deficit dis': HighlightedWord(
      onTap: () => print('attention deficit dis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'assburger': HighlightedWord(
      onTap: () => print('assburger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'assberger': HighlightedWord(
      onTap: () => print('assberger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'trichotilomania': HighlightedWord(
      onTap: () => print('trichotilomania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a.d.h.d.': HighlightedWord(
      onTap: () => print('a.d.h.d.'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ad/hd': HighlightedWord(
      onTap: () => print('ad/hd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'add': HighlightedWord(
      onTap: () => print('add'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'alternating insanity': HighlightedWord(
      onTap: () => print('alternating insanity'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'anancastic neurosis': HighlightedWord(
      onTap: () => print('anancastic neurosis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'anancastic personality': HighlightedWord(
      onTap: () => print('anancastic personality'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'anankastic personality': HighlightedWord(
      onTap: () => print('anankastic personality'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'anorectic': HighlightedWord(
      onTap: () => print('anorectic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'apsergers': HighlightedWord(
      onTap: () => print('apsergers'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'asberger': HighlightedWord(
      onTap: () => print('asberger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'asburger': HighlightedWord(
      onTap: () => print('asburger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'aspberger': HighlightedWord(
      onTap: () => print('aspberger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'asperger': HighlightedWord(
      onTap: () => print('asperger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'aspergian': HighlightedWord(
      onTap: () => print('aspergian'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'aspergic': HighlightedWord(
      onTap: () => print('aspergic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'aspie': HighlightedWord(
      onTap: () => print('aspie'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'aspurger': HighlightedWord(
      onTap: () => print('aspurger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'deppression': HighlightedWord(
      onTap: () => print('deppression'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bolemia': HighlightedWord(
      onTap: () => print('bolemia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'diagnos': HighlightedWord(
      onTap: () => print('diagnos'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'o.c.d.': HighlightedWord(
      onTap: () => print('o.c.d.'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'pipolar': HighlightedWord(
      onTap: () => print('pipolar'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'rapid cycling': HighlightedWord(
      onTap: () => print('rapid cycling'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'rumination': HighlightedWord(
      onTap: () => print('rumination'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'schiizophrenia': HighlightedWord(
      onTap: () => print('schiizophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'schitzo': HighlightedWord(
      onTap: () => print('schitzo'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'schyzophrenia': HighlightedWord(
      onTap: () => print('schyzophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'shizophrenia': HighlightedWord(
      onTap: () => print('shizophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'shizophrenic': HighlightedWord(
      onTap: () => print('shizophrenic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'skitsafrantic': HighlightedWord(
      onTap: () => print('skitsafrantic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'skitzafrenic': HighlightedWord(
      onTap: () => print('skitzafrenic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'skitzophrenia': HighlightedWord(
      onTap: () => print('skitzophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'tricho-tillomania': HighlightedWord(
      onTap: () => print('tricho-tillomania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'trichollomania': HighlightedWord(
      onTap: () => print('trichollomania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'trichotilimania': HighlightedWord(
      onTap: () => print('trichotilimania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'trichotillomania': HighlightedWord(
      onTap: () => print('trichotillomania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'trichotillomannia': HighlightedWord(
      onTap: () => print('trichotillomannia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'trichotillosis': HighlightedWord(
      onTap: () => print('trichotillosis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'scizophrenia': HighlightedWord(
      onTap: () => print('scizophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dpression': HighlightedWord(
      onTap: () => print('dpression'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dual-form insanity': HighlightedWord(
      onTap: () => print('dual-form insanity'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dysthemia': HighlightedWord(
      onTap: () => print('dysthemia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dysthimia': HighlightedWord(
      onTap: () => print('dysthimia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dysthymic': HighlightedWord(
      onTap: () => print('dysthymic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'distimea': HighlightedWord(
      onTap: () => print('distimea'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dystimea': HighlightedWord(
      onTap: () => print('dystimea'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'disthymia': HighlightedWord(
      onTap: () => print('disthymia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dipolar': HighlightedWord(
      onTap: () => print('dipolar'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'enxiety': HighlightedWord(
      onTap: () => print('enxiety'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hysterical neurosis': HighlightedWord(
      onTap: () => print('hysterical neurosis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'insanity of double form': HighlightedWord(
      onTap: () => print('insanity of double form'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dystimia': HighlightedWord(
      onTap: () => print('dystimia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'distimia': HighlightedWord(
      onTap: () => print('distimia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'eating disord': HighlightedWord(
      onTap: () => print('eating disord'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bulimia': HighlightedWord(
      onTap: () => print('bulimia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bulimic': HighlightedWord(
      onTap: () => print('bulimic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'anorexi': HighlightedWord(
      onTap: () => print('anorexi'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cyclothymic': HighlightedWord(
      onTap: () => print('cyclothymic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'merycism': HighlightedWord(
      onTap: () => print('merycism'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'llpdd': HighlightedWord(
      onTap: () => print('llpdd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'excoriation': HighlightedWord(
      onTap: () => print('excoriation'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'do not deserve to': HighlightedWord(
      onTap: () => print('do not deserve to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'social anxie': HighlightedWord(
      onTap: () => print('social anxie'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'mental disease': HighlightedWord(
      onTap: () => print('mental disease'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'kill themselves': HighlightedWord(
      onTap: () => print('kill themselves'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'mentally ill': HighlightedWord(
      onTap: () => print('mentally ill'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'mental health': HighlightedWord(
      onTap: () => print('mental health'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'adhd': HighlightedWord(
      onTap: () => print('adhd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'anxiety': HighlightedWord(
      onTap: () => print('anxiety'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ocd': HighlightedWord(
      onTap: () => print('ocd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ptsd': HighlightedWord(
      onTap: () => print('ptsd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ptsr': HighlightedWord(
      onTap: () => print('ptsr'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ptss': HighlightedWord(
      onTap: () => print('ptss'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'schizo': HighlightedWord(
      onTap: () => print('schizo'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'depres': HighlightedWord(
      onTap: () => print('depres'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'mdd': HighlightedWord(
      onTap: () => print('mdd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dysthymia': HighlightedWord(
      onTap: () => print('dysthymia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'coping': HighlightedWord(
      onTap: () => print('coping'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have felt': HighlightedWord(
      onTap: () => print('i have felt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a poem about': HighlightedWord(
      onTap: () => print('a poem about'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'important to me': HighlightedWord(
      onTap: () => print('important to me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i dont want to': HighlightedWord(
      onTap: () => print('i dont want to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'so angry': HighlightedWord(
      onTap: () => print('so angry'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dehumanizing': HighlightedWord(
      onTap: () => print('dehumanizing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cishet': HighlightedWord(
      onTap: () => print('cishet'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'trauma': HighlightedWord(
      onTap: () => print('trauma'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lot of pain': HighlightedWord(
      onTap: () => print('lot of pain'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'how are you doing': HighlightedWord(
      onTap: () => print('how are you doing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bpd': HighlightedWord(
      onTap: () => print('bpd'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'controlled': HighlightedWord(
      onTap: () => print('controlled'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ableist': HighlightedWord(
      onTap: () => print('ableist'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'suicidal': HighlightedWord(
      onTap: () => print('suicidal'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a lot to me': HighlightedWord(
      onTap: () => print('a lot to me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'break my fast': HighlightedWord(
      onTap: () => print('break my fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i can not afford': HighlightedWord(
      onTap: () => print('i can not afford'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to kill': HighlightedWord(
      onTap: () => print('want to kill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'blade': HighlightedWord(
      onTap: () => print('blade'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'counselling': HighlightedWord(
      onTap: () => print('counselling'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'b/p': HighlightedWord(
      onTap: () => print('b/p'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'disorder': HighlightedWord(
      onTap: () => print('disorder'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'harm': HighlightedWord(
      onTap: () => print('harm'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'wrists': HighlightedWord(
      onTap: () => print('wrists'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'mend': HighlightedWord(
      onTap: () => print('mend'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a friend of mine': HighlightedWord(
      onTap: () => print('a friend of mine'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'will be skinny': HighlightedWord(
      onTap: () => print('will be skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'if you ever need': HighlightedWord(
      onTap: () => print('if you ever need'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ed but': HighlightedWord(
      onTap: () => print('ed but'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i used to have': HighlightedWord(
      onTap: () => print('i used to have'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'as a child': HighlightedWord(
      onTap: () => print('as a child'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'masturbate': HighlightedWord(
      onTap: () => print('masturbate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i will never be': HighlightedWord(
      onTap: () => print('i will never be'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'voices in my': HighlightedWord(
      onTap: () => print('voices in my'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to hug': HighlightedWord(
      onTap: () => print('want to hug'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to die': HighlightedWord(
      onTap: () => print('want to die'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'getting worse': HighlightedWord(
      onTap: () => print('getting worse'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hear voices': HighlightedWord(
      onTap: () => print('hear voices'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'days clean': HighlightedWord(
      onTap: () => print('days clean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dysphoria': HighlightedWord(
      onTap: () => print('dysphoria'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'celexa': HighlightedWord(
      onTap: () => print('celexa'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'illness': HighlightedWord(
      onTap: () => print('illness'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'health issues': HighlightedWord(
      onTap: () => print('health issues'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'reach my goal': HighlightedWord(
      onTap: () => print('reach my goal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'edproblems': HighlightedWord(
      onTap: () => print('edproblems'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'they do not care': HighlightedWord(
      onTap: () => print('they do not care'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'im screaming': HighlightedWord(
      onTap: () => print('im screaming'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'run away': HighlightedWord(
      onTap: () => print('run away'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ranting': HighlightedWord(
      onTap: () => print('ranting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'citalopram': HighlightedWord(
      onTap: () => print('citalopram'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'nausea': HighlightedWord(
      onTap: () => print('nausea'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'borderline': HighlightedWord(
      onTap: () => print('borderline'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'suicide': HighlightedWord(
      onTap: () => print('suicide'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i do not give a': HighlightedWord(
      onTap: () => print('i do not give a'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have been there': HighlightedWord(
      onTap: () => print('i have been there'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'genderfluid': HighlightedWord(
      onTap: () => print('genderfluid'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'god dammit': HighlightedWord(
      onTap: () => print('god dammit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'insecure': HighlightedWord(
      onTap: () => print('insecure'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'gender identity': HighlightedWord(
      onTap: () => print('gender identity'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fed': HighlightedWord(
      onTap: () => print('fed'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'modelling': HighlightedWord(
      onTap: () => print('modelling'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'the loss of': HighlightedWord(
      onTap: () => print('the loss of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am sorry that': HighlightedWord(
      onTap: () => print('i am sorry that'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sorry for being': HighlightedWord(
      onTap: () => print('sorry for being'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'kill myself': HighlightedWord(
      onTap: () => print('kill myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'diseases': HighlightedWord(
      onTap: () => print('diseases'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'unbearable': HighlightedWord(
      onTap: () => print('unbearable'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'number on the scale': HighlightedWord(
      onTap: () => print('number on the scale'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'edprobs': HighlightedWord(
      onTap: () => print('edprobs'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'okay and': HighlightedWord(
      onTap: () => print('okay and'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'no one would': HighlightedWord(
      onTap: () => print('no one would'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to die in': HighlightedWord(
      onTap: () => print('to die in'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i give up': HighlightedWord(
      onTap: () => print('i give up'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'horrid': HighlightedWord(
      onTap: () => print('horrid'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sexually': HighlightedWord(
      onTap: () => print('sexually'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ill people': HighlightedWord(
      onTap: () => print('ill people'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'effects': HighlightedWord(
      onTap: () => print('effects'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'and that i': HighlightedWord(
      onTap: () => print('and that i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'need to talk': HighlightedWord(
      onTap: () => print('need to talk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'relapsing': HighlightedWord(
      onTap: () => print('relapsing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'emo': HighlightedWord(
      onTap: () => print('emo'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am sorry for': HighlightedWord(
      onTap: () => print('i am sorry for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a cis': HighlightedWord(
      onTap: () => print('a cis'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hipbones': HighlightedWord(
      onTap: () => print('hipbones'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'wish i was dead': HighlightedWord(
      onTap: () => print('wish i was dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'deal with it': HighlightedWord(
      onTap: () => print('deal with it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'getting bad again': HighlightedWord(
      onTap: () => print('getting bad again'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel sick': HighlightedWord(
      onTap: () => print('feel sick'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'grieving': HighlightedWord(
      onTap: () => print('grieving'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'thinspo': HighlightedWord(
      onTap: () => print('thinspo'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'now i want to': HighlightedWord(
      onTap: () => print('now i want to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am so sick': HighlightedWord(
      onTap: () => print('i am so sick'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bothered': HighlightedWord(
      onTap: () => print('bothered'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'admitted': HighlightedWord(
      onTap: () => print('admitted'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'prescribed': HighlightedWord(
      onTap: () => print('prescribed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'scars': HighlightedWord(
      onTap: () => print('scars'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'abusive': HighlightedWord(
      onTap: () => print('abusive'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i was a kid': HighlightedWord(
      onTap: () => print('i was a kid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'stereotype': HighlightedWord(
      onTap: () => print('stereotype'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'veteran': HighlightedWord(
      onTap: () => print('veteran'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i stan': HighlightedWord(
      onTap: () => print('i stan'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'going to try and': HighlightedWord(
      onTap: () => print('going to try and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight now': HighlightedWord(
      onTap: () => print('weight now'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'outpatient': HighlightedWord(
      onTap: () => print('outpatient'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'really sad': HighlightedWord(
      onTap: () => print('really sad'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a victim': HighlightedWord(
      onTap: () => print('a victim'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'puking': HighlightedWord(
      onTap: () => print('puking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dizzy': HighlightedWord(
      onTap: () => print('dizzy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'anal': HighlightedWord(
      onTap: () => print('anal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am fasting': HighlightedWord(
      onTap: () => print('am fasting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weeks clean': HighlightedWord(
      onTap: () => print('weeks clean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my existence': HighlightedWord(
      onTap: () => print('my existence'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'trigger': HighlightedWord(
      onTap: () => print('trigger'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not racist': HighlightedWord(
      onTap: () => print('not racist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'irl friends': HighlightedWord(
      onTap: () => print('irl friends'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'mental hospital': HighlightedWord(
      onTap: () => print('mental hospital'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'manic': HighlightedWord(
      onTap: () => print('manic'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'it is racist': HighlightedWord(
      onTap: () => print('it is racist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hearing voices': HighlightedWord(
      onTap: () => print('hearing voices'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'survivor': HighlightedWord(
      onTap: () => print('survivor'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i totally get it': HighlightedWord(
      onTap: () => print('i totally get it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'oppressed': HighlightedWord(
      onTap: () => print('oppressed'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'calories but': HighlightedWord(
      onTap: () => print('calories but'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ednos': HighlightedWord(
      onTap: () => print('ednos'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'intersectional': HighlightedWord(
      onTap: () => print('intersectional'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am scared': HighlightedWord(
      onTap: () => print('i am scared'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'wanting to die': HighlightedWord(
      onTap: () => print('wanting to die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'stains': HighlightedWord(
      onTap: () => print('stains'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sorry i have not been': HighlightedWord(
      onTap: () => print('sorry i have not been'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'all food': HighlightedWord(
      onTap: () => print('all food'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to help': HighlightedWord(
      onTap: () => print('want to help'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'afraid that': HighlightedWord(
      onTap: () => print('afraid that'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'tense': HighlightedWord(
      onTap: () => print('tense'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'worthless': HighlightedWord(
      onTap: () => print('worthless'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'much xx': HighlightedWord(
      onTap: () => print('much xx'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel better soon': HighlightedWord(
      onTap: () => print('feel better soon'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'and never wake up': HighlightedWord(
      onTap: () => print('and never wake up'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'have to deal with': HighlightedWord(
      onTap: () => print('have to deal with'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'the voices in': HighlightedWord(
      onTap: () => print('the voices in'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not alone': HighlightedWord(
      onTap: () => print('not alone'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'masturbating': HighlightedWord(
      onTap: () => print('masturbating'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'gendered': HighlightedWord(
      onTap: () => print('gendered'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'picslip': HighlightedWord(
      onTap: () => print('picslip'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'love xx': HighlightedWord(
      onTap: () => print('love xx'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'gives a shit': HighlightedWord(
      onTap: () => print('gives a shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'effexor': HighlightedWord(
      onTap: () => print('effexor'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'erotic': HighlightedWord(
      onTap: () => print('erotic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'calories for': HighlightedWord(
      onTap: () => print('calories for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'attempts': HighlightedWord(
      onTap: () => print('attempts'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'do not want to eat': HighlightedWord(
      onTap: () => print('do not want to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'was forced': HighlightedWord(
      onTap: () => print('was forced'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'offend': HighlightedWord(
      onTap: () => print('offend'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to make up for': HighlightedWord(
      onTap: () => print('to make up for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fat on my': HighlightedWord(
      onTap: () => print('fat on my'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weeb': HighlightedWord(
      onTap: () => print('weeb'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'do you think you': HighlightedWord(
      onTap: () => print('do you think you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dietician': HighlightedWord(
      onTap: () => print('dietician'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'thigh': HighlightedWord(
      onTap: () => print('thigh'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel like shit': HighlightedWord(
      onTap: () => print('feel like shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'actually crying': HighlightedWord(
      onTap: () => print('actually crying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'months clean': HighlightedWord(
      onTap: () => print('months clean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'alcoholism': HighlightedWord(
      onTap: () => print('alcoholism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to purge': HighlightedWord(
      onTap: () => print('to purge'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'where is the lie': HighlightedWord(
      onTap: () => print('where is the lie'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'shit like this': HighlightedWord(
      onTap: () => print('shit like this'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'horrifying': HighlightedWord(
      onTap: () => print('horrifying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'tendencies': HighlightedWord(
      onTap: () => print('tendencies'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my sex': HighlightedWord(
      onTap: () => print('my sex'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to hurt myself': HighlightedWord(
      onTap: () => print('to hurt myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'useless': HighlightedWord(
      onTap: () => print('useless'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'blocked me for': HighlightedWord(
      onTap: () => print('blocked me for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hid': HighlightedWord(
      onTap: () => print('hid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'wellbutrin': HighlightedWord(
      onTap: () => print('wellbutrin'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'recover': HighlightedWord(
      onTap: () => print('recover'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'vile': HighlightedWord(
      onTap: () => print('vile'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not know if i can': HighlightedWord(
      onTap: () => print('not know if i can'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fat and disgusting': HighlightedWord(
      onTap: () => print('fat and disgusting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'is bloody': HighlightedWord(
      onTap: () => print('is bloody'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hate everything': HighlightedWord(
      onTap: () => print('hate everything'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'razor': HighlightedWord(
      onTap: () => print('razor'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'guilt': HighlightedWord(
      onTap: () => print('guilt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hour fast': HighlightedWord(
      onTap: () => print('hour fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'as someone': HighlightedWord(
      onTap: () => print('as someone'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'duloxetine': HighlightedWord(
      onTap: () => print('duloxetine'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'horny': HighlightedWord(
      onTap: () => print('horny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'counsellor': HighlightedWord(
      onTap: () => print('counsellor'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not eat i': HighlightedWord(
      onTap: () => print('not eat i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel the same way': HighlightedWord(
      onTap: () => print('feel the same way'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'end my life': HighlightedWord(
      onTap: () => print('end my life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight loss': HighlightedWord(
      onTap: () => print('weight loss'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'free will': HighlightedWord(
      onTap: () => print('free will'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hallucinating': HighlightedWord(
      onTap: () => print('hallucinating'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'paranoid': HighlightedWord(
      onTap: () => print('paranoid'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel comfortable': HighlightedWord(
      onTap: () => print('feel comfortable'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'the military': HighlightedWord(
      onTap: () => print('the military'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i want him': HighlightedWord(
      onTap: () => print('i want him'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'all ok': HighlightedWord(
      onTap: () => print('all ok'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'me to kill': HighlightedWord(
      onTap: () => print('me to kill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sexuality': HighlightedWord(
      onTap: () => print('sexuality'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bodyslip': HighlightedWord(
      onTap: () => print('bodyslip'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'thinner than': HighlightedWord(
      onTap: () => print('thinner than'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'apologising': HighlightedWord(
      onTap: () => print('apologising'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'destructive': HighlightedWord(
      onTap: () => print('destructive'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'syndrome': HighlightedWord(
      onTap: () => print('syndrome'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'it is why i': HighlightedWord(
      onTap: () => print('it is why i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'orgasm': HighlightedWord(
      onTap: () => print('orgasm'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not purge': HighlightedWord(
      onTap: () => print('not purge'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'disgusted with myself': HighlightedWord(
      onTap: () => print('disgusted with myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'damage': HighlightedWord(
      onTap: () => print('damage'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cannibal': HighlightedWord(
      onTap: () => print('cannibal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'wanker': HighlightedWord(
      onTap: () => print('wanker'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'before i was': HighlightedWord(
      onTap: () => print('before i was'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sorry to hear that': HighlightedWord(
      onTap: () => print('sorry to hear that'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'it hurts so much': HighlightedWord(
      onTap: () => print('it hurts so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'intersex': HighlightedWord(
      onTap: () => print('intersex'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'broke my fast': HighlightedWord(
      onTap: () => print('broke my fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hope you are well': HighlightedWord(
      onTap: () => print('hope you are well'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hope you are ok': HighlightedWord(
      onTap: () => print('hope you are ok'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'problematic': HighlightedWord(
      onTap: () => print('problematic'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'identifying as': HighlightedWord(
      onTap: () => print('identifying as'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'so skinny and': HighlightedWord(
      onTap: () => print('so skinny and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'criticising': HighlightedWord(
      onTap: () => print('criticising'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'disappear': HighlightedWord(
      onTap: () => print('disappear'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'manipulating': HighlightedWord(
      onTap: () => print('manipulating'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'unstable': HighlightedWord(
      onTap: () => print('unstable'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am such a fat': HighlightedWord(
      onTap: () => print('am such a fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'our bodies': HighlightedWord(
      onTap: () => print('our bodies'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'no one likes me': HighlightedWord(
      onTap: () => print('no one likes me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'helped me a lot': HighlightedWord(
      onTap: () => print('helped me a lot'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i would feel': HighlightedWord(
      onTap: () => print('i would feel'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'vaginas': HighlightedWord(
      onTap: () => print('vaginas'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'treatment': HighlightedWord(
      onTap: () => print('treatment'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'insulted': HighlightedWord(
      onTap: () => print('insulted'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'underweight': HighlightedWord(
      onTap: () => print('underweight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'over calories': HighlightedWord(
      onTap: () => print('over calories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my mental': HighlightedWord(
      onTap: () => print('my mental'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'injection': HighlightedWord(
      onTap: () => print('injection'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'drained': HighlightedWord(
      onTap: () => print('drained'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'isolated': HighlightedWord(
      onTap: () => print('isolated'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sorrow': HighlightedWord(
      onTap: () => print('sorrow'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cuts': HighlightedWord(
      onTap: () => print('cuts'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight i will': HighlightedWord(
      onTap: () => print('weight i will'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'compassion': HighlightedWord(
      onTap: () => print('compassion'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'go to the hospital': HighlightedWord(
      onTap: () => print('go to the hospital'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'what i am going': HighlightedWord(
      onTap: () => print('what i am going'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'rough day': HighlightedWord(
      onTap: () => print('rough day'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'esteem': HighlightedWord(
      onTap: () => print('esteem'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'purged': HighlightedWord(
      onTap: () => print('purged'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'kill him': HighlightedWord(
      onTap: () => print('kill him'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not available': HighlightedWord(
      onTap: () => print('not available'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'threatening': HighlightedWord(
      onTap: () => print('threatening'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'misogynist': HighlightedWord(
      onTap: () => print('misogynist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'into my fast': HighlightedWord(
      onTap: () => print('into my fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'oppression': HighlightedWord(
      onTap: () => print('oppression'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'shrink': HighlightedWord(
      onTap: () => print('shrink'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have not spoken to': HighlightedWord(
      onTap: () => print('i have not spoken to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'voices are': HighlightedWord(
      onTap: () => print('voices are'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'collarbones': HighlightedWord(
      onTap: () => print('collarbones'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'vulnerable': HighlightedWord(
      onTap: () => print('vulnerable'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'inpatient': HighlightedWord(
      onTap: () => print('inpatient'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'posh': HighlightedWord(
      onTap: () => print('posh'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'underage': HighlightedWord(
      onTap: () => print('underage'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i can not bring myself': HighlightedWord(
      onTap: () => print('i can not bring myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have lost': HighlightedWord(
      onTap: () => print('i have lost'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hallucinations': HighlightedWord(
      onTap: () => print('hallucinations'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to get better': HighlightedWord(
      onTap: () => print('want to get better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'psych': HighlightedWord(
      onTap: () => print('psych'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'healing': HighlightedWord(
      onTap: () => print('healing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cals': HighlightedWord(
      onTap: () => print('cals'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i was a teenager': HighlightedWord(
      onTap: () => print('i was a teenager'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i need to lose': HighlightedWord(
      onTap: () => print('i need to lose'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'nostalgic': HighlightedWord(
      onTap: () => print('nostalgic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'pansexual': HighlightedWord(
      onTap: () => print('pansexual'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cries': HighlightedWord(
      onTap: () => print('cries'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'rapist': HighlightedWord(
      onTap: () => print('rapist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'soz': HighlightedWord(
      onTap: () => print('soz'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lowest weight': HighlightedWord(
      onTap: () => print('lowest weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'the feels': HighlightedWord(
      onTap: () => print('the feels'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'racists': HighlightedWord(
      onTap: () => print('racists'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'and apparently': HighlightedWord(
      onTap: () => print('and apparently'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'that feel when': HighlightedWord(
      onTap: () => print('that feel when'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'purging': HighlightedWord(
      onTap: () => print('purging'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i used to love': HighlightedWord(
      onTap: () => print('i used to love'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'overwhelming': HighlightedWord(
      onTap: () => print('overwhelming'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'toxic': HighlightedWord(
      onTap: () => print('toxic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'rants': HighlightedWord(
      onTap: () => print('rants'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'doxycycline': HighlightedWord(
      onTap: () => print('doxycycline'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hurtful': HighlightedWord(
      onTap: () => print('hurtful'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'resist': HighlightedWord(
      onTap: () => print('resist'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ate so much today': HighlightedWord(
      onTap: () => print('ate so much today'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fear food': HighlightedWord(
      onTap: () => print('fear food'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sad all the time': HighlightedWord(
      onTap: () => print('sad all the time'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i cut': HighlightedWord(
      onTap: () => print('i cut'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'vent': HighlightedWord(
      onTap: () => print('vent'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'empathy': HighlightedWord(
      onTap: () => print('empathy'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'insomnia': HighlightedWord(
      onTap: () => print('insomnia'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to live anymore': HighlightedWord(
      onTap: () => print('to live anymore'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'seroquel': HighlightedWord(
      onTap: () => print('seroquel'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'grave': HighlightedWord(
      onTap: () => print('grave'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'theories': HighlightedWord(
      onTap: () => print('theories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fasted': HighlightedWord(
      onTap: () => print('fasted'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have been feeling': HighlightedWord(
      onTap: () => print('i have been feeling'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'endure': HighlightedWord(
      onTap: () => print('endure'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not realise': HighlightedWord(
      onTap: () => print('not realise'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'the army': HighlightedWord(
      onTap: () => print('the army'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'the bottom of the': HighlightedWord(
      onTap: () => print('the bottom of the'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hope i die': HighlightedWord(
      onTap: () => print('hope i die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'restless': HighlightedWord(
      onTap: () => print('restless'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'distress': HighlightedWord(
      onTap: () => print('distress'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fetish': HighlightedWord(
      onTap: () => print('fetish'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'divorced': HighlightedWord(
      onTap: () => print('divorced'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'just got back from': HighlightedWord(
      onTap: () => print('just got back from'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not to cut': HighlightedWord(
      onTap: () => print('not to cut'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'restrict': HighlightedWord(
      onTap: () => print('restrict'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'me full': HighlightedWord(
      onTap: () => print('me full'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'stabbed': HighlightedWord(
      onTap: () => print('stabbed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'talentless': HighlightedWord(
      onTap: () => print('talentless'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lethal': HighlightedWord(
      onTap: () => print('lethal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'overdose': HighlightedWord(
      onTap: () => print('overdose'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'consent': HighlightedWord(
      onTap: () => print('consent'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hope she is ok': HighlightedWord(
      onTap: () => print('hope she is ok'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weighing myself': HighlightedWord(
      onTap: () => print('weighing myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'surgeon': HighlightedWord(
      onTap: () => print('surgeon'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'save me from myself': HighlightedWord(
      onTap: () => print('save me from myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'punish': HighlightedWord(
      onTap: () => print('punish'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'relapse': HighlightedWord(
      onTap: () => print('relapse'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'outed': HighlightedWord(
      onTap: () => print('outed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'colouring': HighlightedWord(
      onTap: () => print('colouring'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'low calorie': HighlightedWord(
      onTap: () => print('low calorie'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'near the end of': HighlightedWord(
      onTap: () => print('near the end of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'rest of my life': HighlightedWord(
      onTap: () => print('rest of my life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'care of yourself': HighlightedWord(
      onTap: () => print('care of yourself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ehat': HighlightedWord(
      onTap: () => print('ehat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'for mental': HighlightedWord(
      onTap: () => print('for mental'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a burden': HighlightedWord(
      onTap: () => print('a burden'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'when i came out': HighlightedWord(
      onTap: () => print('when i came out'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fuc': HighlightedWord(
      onTap: () => print('fuc'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'and ugh': HighlightedWord(
      onTap: () => print('and ugh'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weighed myself': HighlightedWord(
      onTap: () => print('weighed myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'failings': HighlightedWord(
      onTap: () => print('failings'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cryinf': HighlightedWord(
      onTap: () => print('cryinf'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am not worth': HighlightedWord(
      onTap: () => print('am not worth'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'health it': HighlightedWord(
      onTap: () => print('health it'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'narcissistic': HighlightedWord(
      onTap: () => print('narcissistic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'obsessive': HighlightedWord(
      onTap: () => print('obsessive'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'stigma': HighlightedWord(
      onTap: () => print('stigma'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'so fat and': HighlightedWord(
      onTap: () => print('so fat and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am sorry you': HighlightedWord(
      onTap: () => print('i am sorry you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am so stressed': HighlightedWord(
      onTap: () => print('am so stressed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a deep breath': HighlightedWord(
      onTap: () => print('a deep breath'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'pill': HighlightedWord(
      onTap: () => print('pill'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'f u c k': HighlightedWord(
      onTap: () => print('f u c k'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'harsh': HighlightedWord(
      onTap: () => print('harsh'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'what i ate': HighlightedWord(
      onTap: () => print('what i ate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'need to be skinny': HighlightedWord(
      onTap: () => print('need to be skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to love myself': HighlightedWord(
      onTap: () => print('to love myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'doctors': HighlightedWord(
      onTap: () => print('doctors'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'im so fat': HighlightedWord(
      onTap: () => print('im so fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'drink lots of water': HighlightedWord(
      onTap: () => print('drink lots of water'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'now xx': HighlightedWord(
      onTap: () => print('now xx'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'controlling': HighlightedWord(
      onTap: () => print('controlling'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'misogyny': HighlightedWord(
      onTap: () => print('misogyny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'thinspiration': HighlightedWord(
      onTap: () => print('thinspiration'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lose weight': HighlightedWord(
      onTap: () => print('lose weight'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'disturbed': HighlightedWord(
      onTap: () => print('disturbed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'panic': HighlightedWord(
      onTap: () => print('panic'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to cut but': HighlightedWord(
      onTap: () => print('to cut but'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'would kill': HighlightedWord(
      onTap: () => print('would kill'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'shaming': HighlightedWord(
      onTap: () => print('shaming'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'nudes and': HighlightedWord(
      onTap: () => print('nudes and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'it is my fault': HighlightedWord(
      onTap: () => print('it is my fault'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'angry i': HighlightedWord(
      onTap: () => print('angry i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not eaten': HighlightedWord(
      onTap: () => print('not eaten'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'refused': HighlightedWord(
      onTap: () => print('refused'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'agony': HighlightedWord(
      onTap: () => print('agony'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'whiny': HighlightedWord(
      onTap: () => print('whiny'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'terror': HighlightedWord(
      onTap: () => print('terror'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'suffer': HighlightedWord(
      onTap: () => print('suffer'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'it pisses me off': HighlightedWord(
      onTap: () => print('it pisses me off'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'does get better': HighlightedWord(
      onTap: () => print('does get better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'will never get over': HighlightedWord(
      onTap: () => print('will never get over'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i will be dead': HighlightedWord(
      onTap: () => print('i will be dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'prescription': HighlightedWord(
      onTap: () => print('prescription'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'commit': HighlightedWord(
      onTap: () => print('commit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bugging': HighlightedWord(
      onTap: () => print('bugging'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'pedophiles': HighlightedWord(
      onTap: () => print('pedophiles'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'disgrace': HighlightedWord(
      onTap: () => print('disgrace'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'intention': HighlightedWord(
      onTap: () => print('intention'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cunts': HighlightedWord(
      onTap: () => print('cunts'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'younger i': HighlightedWord(
      onTap: () => print('younger i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'chest bones': HighlightedWord(
      onTap: () => print('chest bones'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not defending': HighlightedWord(
      onTap: () => print('not defending'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sadness': HighlightedWord(
      onTap: () => print('sadness'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'smoking weed': HighlightedWord(
      onTap: () => print('smoking weed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'condition': HighlightedWord(
      onTap: () => print('condition'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'xanax': HighlightedWord(
      onTap: () => print('xanax'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'urges': HighlightedWord(
      onTap: () => print('urges'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i want to lose': HighlightedWord(
      onTap: () => print('i want to lose'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am crying so': HighlightedWord(
      onTap: () => print('i am crying so'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'appropriation is': HighlightedWord(
      onTap: () => print('appropriation is'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cutting': HighlightedWord(
      onTap: () => print('cutting'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'needle': HighlightedWord(
      onTap: () => print('needle'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'quit smoking': HighlightedWord(
      onTap: () => print('quit smoking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight and i': HighlightedWord(
      onTap: () => print('weight and i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am lbs': HighlightedWord(
      onTap: () => print('am lbs'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'realised how': HighlightedWord(
      onTap: () => print('realised how'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'labelled': HighlightedWord(
      onTap: () => print('labelled'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'swear to god i': HighlightedWord(
      onTap: () => print('swear to god i'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i need to cut': HighlightedWord(
      onTap: () => print('i need to cut'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a bad person': HighlightedWord(
      onTap: () => print('a bad person'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my weight': HighlightedWord(
      onTap: () => print('my weight'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'reject': HighlightedWord(
      onTap: () => print('reject'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'and i was like': HighlightedWord(
      onTap: () => print('and i was like'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am so worried': HighlightedWord(
      onTap: () => print('i am so worried'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hatred': HighlightedWord(
      onTap: () => print('hatred'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'you are so pretty': HighlightedWord(
      onTap: () => print('you are so pretty'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dildos': HighlightedWord(
      onTap: () => print('dildos'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am still alive': HighlightedWord(
      onTap: () => print('am still alive'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'attacking': HighlightedWord(
      onTap: () => print('attacking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'apologist': HighlightedWord(
      onTap: () => print('apologist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'counting calories': HighlightedWord(
      onTap: () => print('counting calories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'loneliness': HighlightedWord(
      onTap: () => print('loneliness'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'drowning': HighlightedWord(
      onTap: () => print('drowning'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'erasure': HighlightedWord(
      onTap: () => print('erasure'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have a headache': HighlightedWord(
      onTap: () => print('i have a headache'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sexism': HighlightedWord(
      onTap: () => print('sexism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to swallow': HighlightedWord(
      onTap: () => print('to swallow'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'marks': HighlightedWord(
      onTap: () => print('marks'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'can not do this anymore': HighlightedWord(
      onTap: () => print('can not do this anymore'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'vomiting': HighlightedWord(
      onTap: () => print('vomiting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'abuse': HighlightedWord(
      onTap: () => print('abuse'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'moan': HighlightedWord(
      onTap: () => print('moan'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'femininity': HighlightedWord(
      onTap: () => print('femininity'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'please stay': HighlightedWord(
      onTap: () => print('please stay'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to be skinny': HighlightedWord(
      onTap: () => print('want to be skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'agender': HighlightedWord(
      onTap: () => print('agender'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hate life': HighlightedWord(
      onTap: () => print('hate life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'been clean': HighlightedWord(
      onTap: () => print('been clean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'intolerant': HighlightedWord(
      onTap: () => print('intolerant'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'myself to eat': HighlightedWord(
      onTap: () => print('myself to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'so alone': HighlightedWord(
      onTap: () => print('so alone'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bawling': HighlightedWord(
      onTap: () => print('bawling'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i purge': HighlightedWord(
      onTap: () => print('i purge'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'so scared': HighlightedWord(
      onTap: () => print('so scared'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'they/them': HighlightedWord(
      onTap: () => print('they/them'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'horrendous': HighlightedWord(
      onTap: () => print('horrendous'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'grin': HighlightedWord(
      onTap: () => print('grin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ableism': HighlightedWord(
      onTap: () => print('ableism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bullies': HighlightedWord(
      onTap: () => print('bullies'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'victim of': HighlightedWord(
      onTap: () => print('victim of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'alone and': HighlightedWord(
      onTap: () => print('alone and'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'anxious': HighlightedWord(
      onTap: () => print('anxious'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'androgynous': HighlightedWord(
      onTap: () => print('androgynous'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lexapro': HighlightedWord(
      onTap: () => print('lexapro'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'assure': HighlightedWord(
      onTap: () => print('assure'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'crying so much': HighlightedWord(
      onTap: () => print('crying so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my own fault': HighlightedWord(
      onTap: () => print('my own fault'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not stop crying': HighlightedWord(
      onTap: () => print('not stop crying'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'failure': HighlightedWord(
      onTap: () => print('failure'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'heroin': HighlightedWord(
      onTap: () => print('heroin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lgbt+': HighlightedWord(
      onTap: () => print('lgbt+'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'health problems': HighlightedWord(
      onTap: () => print('health problems'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'killing people': HighlightedWord(
      onTap: () => print('killing people'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'tired omg': HighlightedWord(
      onTap: () => print('tired omg'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'attacks': HighlightedWord(
      onTap: () => print('attacks'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fat pig': HighlightedWord(
      onTap: () => print('fat pig'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am fat i': HighlightedWord(
      onTap: () => print('am fat i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'im crying so': HighlightedWord(
      onTap: () => print('im crying so'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not sleeping': HighlightedWord(
      onTap: () => print('not sleeping'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel sad': HighlightedWord(
      onTap: () => print('feel sad'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'be alone': HighlightedWord(
      onTap: () => print('be alone'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hate people': HighlightedWord(
      onTap: () => print('hate people'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'drowned': HighlightedWord(
      onTap: () => print('drowned'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'too x': HighlightedWord(
      onTap: () => print('too x'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i want to cut': HighlightedWord(
      onTap: () => print('i want to cut'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'manipulate': HighlightedWord(
      onTap: () => print('manipulate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'too fat for': HighlightedWord(
      onTap: () => print('too fat for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'masturbation': HighlightedWord(
      onTap: () => print('masturbation'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'forced to eat': HighlightedWord(
      onTap: () => print('forced to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am struggling': HighlightedWord(
      onTap: () => print('am struggling'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'how hard it is': HighlightedWord(
      onTap: () => print('how hard it is'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bleed': HighlightedWord(
      onTap: () => print('bleed'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'threatened': HighlightedWord(
      onTap: () => print('threatened'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have been following': HighlightedWord(
      onTap: () => print('i have been following'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'wreck': HighlightedWord(
      onTap: () => print('wreck'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my lw': HighlightedWord(
      onTap: () => print('my lw'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have never liked': HighlightedWord(
      onTap: () => print('i have never liked'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'med': HighlightedWord(
      onTap: () => print('med'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'can get away with': HighlightedWord(
      onTap: () => print('can get away with'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'in pain': HighlightedWord(
      onTap: () => print('in pain'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to therapy': HighlightedWord(
      onTap: () => print('to therapy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'as long as they': HighlightedWord(
      onTap: () => print('as long as they'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel so much better': HighlightedWord(
      onTap: () => print('feel so much better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'pissed off': HighlightedWord(
      onTap: () => print('pissed off'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight again': HighlightedWord(
      onTap: () => print('weight again'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'still struggle': HighlightedWord(
      onTap: () => print('still struggle'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'broke down': HighlightedWord(
      onTap: () => print('broke down'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'worrying': HighlightedWord(
      onTap: () => print('worrying'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'thyroid': HighlightedWord(
      onTap: () => print('thyroid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am going through': HighlightedWord(
      onTap: () => print('am going through'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am losing': HighlightedWord(
      onTap: () => print('am losing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'exploited': HighlightedWord(
      onTap: () => print('exploited'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'this is too much': HighlightedWord(
      onTap: () => print('this is too much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'give a shit': HighlightedWord(
      onTap: () => print('give a shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to hate me': HighlightedWord(
      onTap: () => print('to hate me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my wrist': HighlightedWord(
      onTap: () => print('my wrist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'escape': HighlightedWord(
      onTap: () => print('escape'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i self': HighlightedWord(
      onTap: () => print('i self'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'have gained so': HighlightedWord(
      onTap: () => print('have gained so'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'measurements': HighlightedWord(
      onTap: () => print('measurements'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'and i am trying': HighlightedWord(
      onTap: () => print('and i am trying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'reason to live': HighlightedWord(
      onTap: () => print('reason to live'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'do not cut': HighlightedWord(
      onTap: () => print('do not cut'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'made me eat': HighlightedWord(
      onTap: () => print('made me eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'deserve to die': HighlightedWord(
      onTap: () => print('deserve to die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bmi': HighlightedWord(
      onTap: () => print('bmi'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am disgusting': HighlightedWord(
      onTap: () => print('am disgusting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'laxative': HighlightedWord(
      onTap: () => print('laxative'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'got my period': HighlightedWord(
      onTap: () => print('got my period'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my own skin': HighlightedWord(
      onTap: () => print('my own skin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'gained weight': HighlightedWord(
      onTap: () => print('gained weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i actually feel': HighlightedWord(
      onTap: () => print('i actually feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'let me die': HighlightedWord(
      onTap: () => print('let me die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not :)': HighlightedWord(
      onTap: () => print('not :)'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hate myself': HighlightedWord(
      onTap: () => print('hate myself'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bullied': HighlightedWord(
      onTap: () => print('bullied'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fat it is': HighlightedWord(
      onTap: () => print('fat it is'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'look in the mirror': HighlightedWord(
      onTap: () => print('look in the mirror'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel so fat': HighlightedWord(
      onTap: () => print('feel so fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'flesh': HighlightedWord(
      onTap: () => print('flesh'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'strain': HighlightedWord(
      onTap: () => print('strain'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am still fat': HighlightedWord(
      onTap: () => print('am still fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight does': HighlightedWord(
      onTap: () => print('weight does'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'get what you mean': HighlightedWord(
      onTap: () => print('get what you mean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'abdominal': HighlightedWord(
      onTap: () => print('abdominal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'you feel better': HighlightedWord(
      onTap: () => print('you feel better'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'died in': HighlightedWord(
      onTap: () => print('died in'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'raping': HighlightedWord(
      onTap: () => print('raping'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'self-care': HighlightedWord(
      onTap: () => print('self-care'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'purge but': HighlightedWord(
      onTap: () => print('purge but'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel happy': HighlightedWord(
      onTap: () => print('feel happy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'gutted': HighlightedWord(
      onTap: () => print('gutted'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'devastated': HighlightedWord(
      onTap: () => print('devastated'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel shit': HighlightedWord(
      onTap: () => print('feel shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'scales': HighlightedWord(
      onTap: () => print('scales'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am shit': HighlightedWord(
      onTap: () => print('i am shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'it makes me feel': HighlightedWord(
      onTap: () => print('it makes me feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'water fast': HighlightedWord(
      onTap: () => print('water fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am a fat': HighlightedWord(
      onTap: () => print('i am a fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'whereas': HighlightedWord(
      onTap: () => print('whereas'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my ed': HighlightedWord(
      onTap: () => print('my ed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bloat': HighlightedWord(
      onTap: () => print('bloat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i hate my life': HighlightedWord(
      onTap: () => print('i hate my life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a waste of space': HighlightedWord(
      onTap: () => print('a waste of space'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'clean from': HighlightedWord(
      onTap: () => print('clean from'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'innocence': HighlightedWord(
      onTap: () => print('innocence'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to try and sleep': HighlightedWord(
      onTap: () => print('to try and sleep'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am going to end': HighlightedWord(
      onTap: () => print('am going to end'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am not the only one': HighlightedWord(
      onTap: () => print('am not the only one'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'dizziness': HighlightedWord(
      onTap: () => print('dizziness'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'abortion': HighlightedWord(
      onTap: () => print('abortion'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'because i am fat': HighlightedWord(
      onTap: () => print('because i am fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am thin': HighlightedWord(
      onTap: () => print('am thin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'need someone to talk': HighlightedWord(
      onTap: () => print('need someone to talk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sob': HighlightedWord(
      onTap: () => print('sob'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am fat and': HighlightedWord(
      onTap: () => print('i am fat and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'you will be fine': HighlightedWord(
      onTap: () => print('you will be fine'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'how fat i am': HighlightedWord(
      onTap: () => print('how fat i am'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'kill herself': HighlightedWord(
      onTap: () => print('kill herself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fraud': HighlightedWord(
      onTap: () => print('fraud'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'betrayed': HighlightedWord(
      onTap: () => print('betrayed'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'personalities': HighlightedWord(
      onTap: () => print('personalities'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fat fat': HighlightedWord(
      onTap: () => print('fat fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my hip bones': HighlightedWord(
      onTap: () => print('my hip bones'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'paranoia': HighlightedWord(
      onTap: () => print('paranoia'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'virginity': HighlightedWord(
      onTap: () => print('virginity'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not gain': HighlightedWord(
      onTap: () => print('not gain'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i cant do this': HighlightedWord(
      onTap: () => print('i cant do this'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'so sorry to': HighlightedWord(
      onTap: () => print('so sorry to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'abusing': HighlightedWord(
      onTap: () => print('abusing'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'deserve to be happy': HighlightedWord(
      onTap: () => print('deserve to be happy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to live': HighlightedWord(
      onTap: () => print('want to live'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'you realise': HighlightedWord(
      onTap: () => print('you realise'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'commenting': HighlightedWord(
      onTap: () => print('commenting'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'be thin': HighlightedWord(
      onTap: () => print('be thin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'help i': HighlightedWord(
      onTap: () => print('help i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'drop dead': HighlightedWord(
      onTap: () => print('drop dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'edgy': HighlightedWord(
      onTap: () => print('edgy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight it': HighlightedWord(
      onTap: () => print('weight it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i feel like it': HighlightedWord(
      onTap: () => print('i feel like it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'being fat': HighlightedWord(
      onTap: () => print('being fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'flashbacks': HighlightedWord(
      onTap: () => print('flashbacks'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'someone to talk to': HighlightedWord(
      onTap: () => print('someone to talk to'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sorry for your': HighlightedWord(
      onTap: () => print('sorry for your'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'haunt': HighlightedWord(
      onTap: () => print('haunt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'delusion': HighlightedWord(
      onTap: () => print('delusion'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i do not care about': HighlightedWord(
      onTap: () => print('i do not care about'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hate my body': HighlightedWord(
      onTap: () => print('hate my body'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'die right now': HighlightedWord(
      onTap: () => print('die right now'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bothering': HighlightedWord(
      onTap: () => print('bothering'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'imaginary': HighlightedWord(
      onTap: () => print('imaginary'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am just sick of': HighlightedWord(
      onTap: () => print('am just sick of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bully': HighlightedWord(
      onTap: () => print('bully'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'water weight': HighlightedWord(
      onTap: () => print('water weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am already dead': HighlightedWord(
      onTap: () => print('i am already dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'mentalhealth': HighlightedWord(
      onTap: () => print('mentalhealth'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not well': HighlightedWord(
      onTap: () => print('not well'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am so pathetic': HighlightedWord(
      onTap: () => print('i am so pathetic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'go for a walk': HighlightedWord(
      onTap: () => print('go for a walk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have been up': HighlightedWord(
      onTap: () => print('i have been up'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am trash': HighlightedWord(
      onTap: () => print('i am trash'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'void': HighlightedWord(
      onTap: () => print('void'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'safe space': HighlightedWord(
      onTap: () => print('safe space'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'do not want him to': HighlightedWord(
      onTap: () => print('do not want him to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel so ill': HighlightedWord(
      onTap: () => print('feel so ill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'it is not the same': HighlightedWord(
      onTap: () => print('it is not the same'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a piece of shit': HighlightedWord(
      onTap: () => print('a piece of shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i can not deal with': HighlightedWord(
      onTap: () => print('i can not deal with'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'are feeling better': HighlightedWord(
      onTap: () => print('are feeling better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'in prison': HighlightedWord(
      onTap: () => print('in prison'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lucid': HighlightedWord(
      onTap: () => print('lucid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'overweight': HighlightedWord(
      onTap: () => print('overweight'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fu ck': HighlightedWord(
      onTap: () => print('fu ck'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'veganism': HighlightedWord(
      onTap: () => print('veganism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'whining': HighlightedWord(
      onTap: () => print('whining'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'gasp': HighlightedWord(
      onTap: () => print('gasp'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'have lost weight': HighlightedWord(
      onTap: () => print('have lost weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'replying': HighlightedWord(
      onTap: () => print('replying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'consciousness': HighlightedWord(
      onTap: () => print('consciousness'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'desperation': HighlightedWord(
      onTap: () => print('desperation'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'put on weight': HighlightedWord(
      onTap: () => print('put on weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i should probably sleep': HighlightedWord(
      onTap: () => print('i should probably sleep'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fat today': HighlightedWord(
      onTap: () => print('fat today'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'im here for you': HighlightedWord(
      onTap: () => print('im here for you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'it makes me sad': HighlightedWord(
      onTap: () => print('it makes me sad'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'aggressively': HighlightedWord(
      onTap: () => print('aggressively'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'choking': HighlightedWord(
      onTap: () => print('choking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'never happened': HighlightedWord(
      onTap: () => print('never happened'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am a size': HighlightedWord(
      onTap: () => print('i am a size'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'when i reach': HighlightedWord(
      onTap: () => print('when i reach'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to feel something': HighlightedWord(
      onTap: () => print('to feel something'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'calorie intake': HighlightedWord(
      onTap: () => print('calorie intake'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'so ugly and': HighlightedWord(
      onTap: () => print('so ugly and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'any weight': HighlightedWord(
      onTap: () => print('any weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hospitalized': HighlightedWord(
      onTap: () => print('hospitalized'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'blowjob': HighlightedWord(
      onTap: () => print('blowjob'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'choked': HighlightedWord(
      onTap: () => print('choked'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'guts': HighlightedWord(
      onTap: () => print('guts'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'acid': HighlightedWord(
      onTap: () => print('acid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'deeper': HighlightedWord(
      onTap: () => print('deeper'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i feel so sick': HighlightedWord(
      onTap: () => print('i feel so sick'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'love and care': HighlightedWord(
      onTap: () => print('love and care'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'murdering': HighlightedWord(
      onTap: () => print('murdering'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hope you feel': HighlightedWord(
      onTap: () => print('hope you feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'kilos': HighlightedWord(
      onTap: () => print('kilos'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'self hate': HighlightedWord(
      onTap: () => print('self hate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a few years ago': HighlightedWord(
      onTap: () => print('a few years ago'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hateful': HighlightedWord(
      onTap: () => print('hateful'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fat i can': HighlightedWord(
      onTap: () => print('fat i can'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'pro ana': HighlightedWord(
      onTap: () => print('pro ana'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'shitting': HighlightedWord(
      onTap: () => print('shitting'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'violent': HighlightedWord(
      onTap: () => print('violent'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'eds': HighlightedWord(
      onTap: () => print('eds'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'people i love': HighlightedWord(
      onTap: () => print('people i love'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cum': HighlightedWord(
      onTap: () => print('cum'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'body so much': HighlightedWord(
      onTap: () => print('body so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my metabolism': HighlightedWord(
      onTap: () => print('my metabolism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'this is so ugly': HighlightedWord(
      onTap: () => print('this is so ugly'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'deprivation': HighlightedWord(
      onTap: () => print('deprivation'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cryig': HighlightedWord(
      onTap: () => print('cryig'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'threats': HighlightedWord(
      onTap: () => print('threats'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fat like': HighlightedWord(
      onTap: () => print('fat like'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to talk about it': HighlightedWord(
      onTap: () => print('to talk about it'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'be more active': HighlightedWord(
      onTap: () => print('be more active'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am so fat': HighlightedWord(
      onTap: () => print('am so fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'in danger': HighlightedWord(
      onTap: () => print('in danger'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'clingy': HighlightedWord(
      onTap: () => print('clingy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lucifer': HighlightedWord(
      onTap: () => print('lucifer'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feel so disgusting': HighlightedWord(
      onTap: () => print('feel so disgusting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i felt like i': HighlightedWord(
      onTap: () => print('i felt like i'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'would like to talk': HighlightedWord(
      onTap: () => print('would like to talk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'more calories': HighlightedWord(
      onTap: () => print('more calories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i will never forget': HighlightedWord(
      onTap: () => print('i will never forget'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'have loads': HighlightedWord(
      onTap: () => print('have loads'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'misunderstanding': HighlightedWord(
      onTap: () => print('misunderstanding'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not belong': HighlightedWord(
      onTap: () => print('not belong'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weigh myself': HighlightedWord(
      onTap: () => print('weigh myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'grief': HighlightedWord(
      onTap: () => print('grief'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'struggled with': HighlightedWord(
      onTap: () => print('struggled with'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to hurt': HighlightedWord(
      onTap: () => print('want to hurt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fatter': HighlightedWord(
      onTap: () => print('fatter'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'so cute im': HighlightedWord(
      onTap: () => print('so cute im'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'your ed': HighlightedWord(
      onTap: () => print('your ed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not skinny': HighlightedWord(
      onTap: () => print('not skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'and suddenly i': HighlightedWord(
      onTap: () => print('and suddenly i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'insults': HighlightedWord(
      onTap: () => print('insults'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'for nudes': HighlightedWord(
      onTap: () => print('for nudes'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i wanna die': HighlightedWord(
      onTap: () => print('i wanna die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not felt': HighlightedWord(
      onTap: () => print('not felt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'queer': HighlightedWord(
      onTap: () => print('queer'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'spectrum': HighlightedWord(
      onTap: () => print('spectrum'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'patches': HighlightedWord(
      onTap: () => print('patches'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'scared i': HighlightedWord(
      onTap: () => print('scared i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'harass': HighlightedWord(
      onTap: () => print('harass'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cut but i': HighlightedWord(
      onTap: () => print('cut but i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'disabled': HighlightedWord(
      onTap: () => print('disabled'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'gain weight and': HighlightedWord(
      onTap: () => print('gain weight and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feels that way': HighlightedWord(
      onTap: () => print('feels that way'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'physical health': HighlightedWord(
      onTap: () => print('physical health'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am so sad and': HighlightedWord(
      onTap: () => print('am so sad and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'how skinny': HighlightedWord(
      onTap: () => print('how skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight this': HighlightedWord(
      onTap: () => print('weight this'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cellulite': HighlightedWord(
      onTap: () => print('cellulite'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'rest of his life': HighlightedWord(
      onTap: () => print('rest of his life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'breakdown': HighlightedWord(
      onTap: () => print('breakdown'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'blue hair': HighlightedWord(
      onTap: () => print('blue hair'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'the victim': HighlightedWord(
      onTap: () => print('the victim'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'nightmares': HighlightedWord(
      onTap: () => print('nightmares'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'asexual': HighlightedWord(
      onTap: () => print('asexual'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'healed': HighlightedWord(
      onTap: () => print('healed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'forgiveness': HighlightedWord(
      onTap: () => print('forgiveness'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'makes me cry': HighlightedWord(
      onTap: () => print('makes me cry'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'intercourse': HighlightedWord(
      onTap: () => print('intercourse'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'in the mirror i': HighlightedWord(
      onTap: () => print('in the mirror i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'myfitnesspal': HighlightedWord(
      onTap: () => print('myfitnesspal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hot water bottle': HighlightedWord(
      onTap: () => print('hot water bottle'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'mourning': HighlightedWord(
      onTap: () => print('mourning'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight at': HighlightedWord(
      onTap: () => print('weight at'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am so tired': HighlightedWord(
      onTap: () => print('i am so tired'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'starve': HighlightedWord(
      onTap: () => print('starve'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'prostate': HighlightedWord(
      onTap: () => print('prostate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'calories i': HighlightedWord(
      onTap: () => print('calories i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i should be happy': HighlightedWord(
      onTap: () => print('i should be happy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not blame yourself': HighlightedWord(
      onTap: () => print('not blame yourself'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'tried to kill': HighlightedWord(
      onTap: () => print('tried to kill'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'my death': HighlightedWord(
      onTap: () => print('my death'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'stained': HighlightedWord(
      onTap: () => print('stained'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i want to sleep': HighlightedWord(
      onTap: () => print('i want to sleep'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'assault': HighlightedWord(
      onTap: () => print('assault'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'very sad and': HighlightedWord(
      onTap: () => print('very sad and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'painkillers': HighlightedWord(
      onTap: () => print('painkillers'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'is skinny': HighlightedWord(
      onTap: () => print('is skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'amazingly': HighlightedWord(
      onTap: () => print('amazingly'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'unwell': HighlightedWord(
      onTap: () => print('unwell'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'imagining': HighlightedWord(
      onTap: () => print('imagining'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'and purge': HighlightedWord(
      onTap: () => print('and purge'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'accusing': HighlightedWord(
      onTap: () => print('accusing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'all women': HighlightedWord(
      onTap: () => print('all women'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'like calories': HighlightedWord(
      onTap: () => print('like calories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to talk': HighlightedWord(
      onTap: () => print('want to talk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'apologizing': HighlightedWord(
      onTap: () => print('apologizing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'racism': HighlightedWord(
      onTap: () => print('racism'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to help you': HighlightedWord(
      onTap: () => print('to help you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'have to fight': HighlightedWord(
      onTap: () => print('have to fight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'scaring me': HighlightedWord(
      onTap: () => print('scaring me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'upsetting': HighlightedWord(
      onTap: () => print('upsetting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'misgender': HighlightedWord(
      onTap: () => print('misgender'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'this disease': HighlightedWord(
      onTap: () => print('this disease'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'rape': HighlightedWord(
      onTap: () => print('rape'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'eat nothing': HighlightedWord(
      onTap: () => print('eat nothing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i can not handle this': HighlightedWord(
      onTap: () => print('i can not handle this'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am drinking': HighlightedWord(
      onTap: () => print('i am drinking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i wanna hug': HighlightedWord(
      onTap: () => print('i wanna hug'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'own life': HighlightedWord(
      onTap: () => print('own life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cope': HighlightedWord(
      onTap: () => print('cope'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'skinnier': HighlightedWord(
      onTap: () => print('skinnier'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i would be dead': HighlightedWord(
      onTap: () => print('i would be dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'abnormal': HighlightedWord(
      onTap: () => print('abnormal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'aroused': HighlightedWord(
      onTap: () => print('aroused'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'calming': HighlightedWord(
      onTap: () => print('calming'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'purge and': HighlightedWord(
      onTap: () => print('purge and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'abandon': HighlightedWord(
      onTap: () => print('abandon'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to look after': HighlightedWord(
      onTap: () => print('to look after'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to get help': HighlightedWord(
      onTap: () => print('to get help'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'been crying': HighlightedWord(
      onTap: () => print('been crying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'swallowing': HighlightedWord(
      onTap: () => print('swallowing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'paxil': HighlightedWord(
      onTap: () => print('paxil'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'perceived': HighlightedWord(
      onTap: () => print('perceived'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'eaten so much': HighlightedWord(
      onTap: () => print('eaten so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'broken i am': HighlightedWord(
      onTap: () => print('broken i am'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'a rough': HighlightedWord(
      onTap: () => print('a rough'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'murderer': HighlightedWord(
      onTap: () => print('murderer'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'make me eat': HighlightedWord(
      onTap: () => print('make me eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fat again': HighlightedWord(
      onTap: () => print('fat again'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am afraid to': HighlightedWord(
      onTap: () => print('i am afraid to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'made me feel': HighlightedWord(
      onTap: () => print('made me feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'ded': HighlightedWord(
      onTap: () => print('ded'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'the weight i': HighlightedWord(
      onTap: () => print('the weight i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight but i': HighlightedWord(
      onTap: () => print('weight but i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'liquid fast': HighlightedWord(
      onTap: () => print('liquid fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'body posi': HighlightedWord(
      onTap: () => print('body posi'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'you are lovely': HighlightedWord(
      onTap: () => print('you are lovely'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'trans': HighlightedWord(
      onTap: () => print('trans'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'be skinny and': HighlightedWord(
      onTap: () => print('be skinny and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want to cry': HighlightedWord(
      onTap: () => print('want to cry'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'weight since': HighlightedWord(
      onTap: () => print('weight since'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to jump off a': HighlightedWord(
      onTap: () => print('to jump off a'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am too fat': HighlightedWord(
      onTap: () => print('am too fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i feel sorry for': HighlightedWord(
      onTap: () => print('i feel sorry for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'want a hug': HighlightedWord(
      onTap: () => print('want a hug'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'oppressing': HighlightedWord(
      onTap: () => print('oppressing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fasting and': HighlightedWord(
      onTap: () => print('fasting and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'terrified': HighlightedWord(
      onTap: () => print('terrified'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'puke': HighlightedWord(
      onTap: () => print('puke'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'so much weight': HighlightedWord(
      onTap: () => print('so much weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'on the edge of': HighlightedWord(
      onTap: () => print('on the edge of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am still not over': HighlightedWord(
      onTap: () => print('am still not over'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'and i just feel': HighlightedWord(
      onTap: () => print('and i just feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'fearless': HighlightedWord(
      onTap: () => print('fearless'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lose more': HighlightedWord(
      onTap: () => print('lose more'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'but i can not eat': HighlightedWord(
      onTap: () => print('but i can not eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'how to explain': HighlightedWord(
      onTap: () => print('how to explain'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'not hate you': HighlightedWord(
      onTap: () => print('not hate you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'wanted to die': HighlightedWord(
      onTap: () => print('wanted to die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'erection': HighlightedWord(
      onTap: () => print('erection'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'furiously': HighlightedWord(
      onTap: () => print('furiously'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sjw': HighlightedWord(
      onTap: () => print('sjw'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'have lost so much': HighlightedWord(
      onTap: () => print('have lost so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i wanna kill': HighlightedWord(
      onTap: () => print('i wanna kill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'sedated': HighlightedWord(
      onTap: () => print('sedated'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'vibrator': HighlightedWord(
      onTap: () => print('vibrator'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'realise it': HighlightedWord(
      onTap: () => print('realise it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'beat the shit out': HighlightedWord(
      onTap: () => print('beat the shit out'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'capitalist': HighlightedWord(
      onTap: () => print('capitalist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'in the hospital for': HighlightedWord(
      onTap: () => print('in the hospital for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bi': HighlightedWord(
      onTap: () => print('bi'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cymbalta': HighlightedWord(
      onTap: () => print('cymbalta'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'porn video': HighlightedWord(
      onTap: () => print('porn video'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'much fat': HighlightedWord(
      onTap: () => print('much fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'offensive': HighlightedWord(
      onTap: () => print('offensive'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'myself in the mirror': HighlightedWord(
      onTap: () => print('myself in the mirror'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am going to kill': HighlightedWord(
      onTap: () => print('am going to kill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cringing': HighlightedWord(
      onTap: () => print('cringing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'the navy': HighlightedWord(
      onTap: () => print('the navy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'bleach': HighlightedWord(
      onTap: () => print('bleach'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'afghanistan': HighlightedWord(
      onTap: () => print('afghanistan'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'they have no idea': HighlightedWord(
      onTap: () => print('they have no idea'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'severely': HighlightedWord(
      onTap: () => print('severely'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'am skinny': HighlightedWord(
      onTap: () => print('am skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hetero': HighlightedWord(
      onTap: () => print('hetero'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'an ed': HighlightedWord(
      onTap: () => print('an ed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'constipation': HighlightedWord(
      onTap: () => print('constipation'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'pains': HighlightedWord(
      onTap: () => print('pains'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am afraid of': HighlightedWord(
      onTap: () => print('i am afraid of'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'curiosity': HighlightedWord(
      onTap: () => print('curiosity'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'was in hospital': HighlightedWord(
      onTap: () => print('was in hospital'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'hysterically': HighlightedWord(
      onTap: () => print('hysterically'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'torture': HighlightedWord(
      onTap: () => print('torture'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'to stop myself from': HighlightedWord(
      onTap: () => print('to stop myself from'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'coward': HighlightedWord(
      onTap: () => print('coward'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'it was in the': HighlightedWord(
      onTap: () => print('it was in the'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'boobs': HighlightedWord(
      onTap: () => print('boobs'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'despite': HighlightedWord(
      onTap: () => print('despite'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'lunatic': HighlightedWord(
      onTap: () => print('lunatic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'wiped': HighlightedWord(
      onTap: () => print('wiped'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am a mess': HighlightedWord(
      onTap: () => print('i am a mess'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'deserved better': HighlightedWord(
      onTap: () => print('deserved better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'body image': HighlightedWord(
      onTap: () => print('body image'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'cruel': HighlightedWord(
      onTap: () => print('cruel'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'paracetamol': HighlightedWord(
      onTap: () => print('paracetamol'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'you need to eat': HighlightedWord(
      onTap: () => print('you need to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i am nervous': HighlightedWord(
      onTap: () => print('i am nervous'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i have to eat': HighlightedWord(
      onTap: () => print('i have to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'kill yourself': HighlightedWord(
      onTap: () => print('kill yourself'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'you are stronger than': HighlightedWord(
      onTap: () => print('you are stronger than'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'survived': HighlightedWord(
      onTap: () => print('survived'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'i will miss you': HighlightedWord(
      onTap: () => print('i will miss you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'feminist': HighlightedWord(
      onTap: () => print('feminist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    'you are not fat': HighlightedWord(
      onTap: () => print('you are not fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
  };
}
