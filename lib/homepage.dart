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
                fontSize: 20,
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
        fontWeight: FontWeight.bold,
      ),
    ),
    'attention deficit w/ hyperactivity': HighlightedWord(
      onTap: () => print('attention deficit w/ hyperactivity'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'attention deflict distorder': HighlightedWord(
      onTap: () => print('attention deflict distorder'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'attn deficit w hyperact': HighlightedWord(
      onTap: () => print('attn deficit w hyperact'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'auspergers': HighlightedWord(
      onTap: () => print('auspergers'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'austism': HighlightedWord(
      onTap: () => print('austism'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'austistic': HighlightedWord(
      onTap: () => print('austistic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'authism': HighlightedWord(
      onTap: () => print('authism'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'authistic': HighlightedWord(
      onTap: () => print('authistic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'autisim': HighlightedWord(
      onTap: () => print('autisim'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'autism': HighlightedWord(
      onTap: () => print('autism'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'autistic': HighlightedWord(
      onTap: () => print('autistic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'attention deficit hyperactivity dis': HighlightedWord(
      onTap: () => print('attention deficit hyperactivity dis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bp1': HighlightedWord(
      onTap: () => print('bp1'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bulemia': HighlightedWord(
      onTap: () => print('bulemia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bulemic': HighlightedWord(
      onTap: () => print('bulemic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bulimea': HighlightedWord(
      onTap: () => print('bulimea'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bullemia': HighlightedWord(
      onTap: () => print('bullemia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'circular insanity': HighlightedWord(
      onTap: () => print('circular insanity'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'combat neurosis': HighlightedWord(
      onTap: () => print('combat neurosis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cyclophrenia': HighlightedWord(
      onTap: () => print('cyclophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cyclophrenic': HighlightedWord(
      onTap: () => print('cyclophrenic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cyclothymia': HighlightedWord(
      onTap: () => print('cyclothymia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bp2': HighlightedWord(
      onTap: () => print('bp2'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'attention deficit dis': HighlightedWord(
      onTap: () => print('attention deficit dis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'assburger': HighlightedWord(
      onTap: () => print('assburger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'assberger': HighlightedWord(
      onTap: () => print('assberger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'trichotilomania': HighlightedWord(
      onTap: () => print('trichotilomania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a.d.h.d.': HighlightedWord(
      onTap: () => print('a.d.h.d.'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ad/hd': HighlightedWord(
      onTap: () => print('ad/hd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'add': HighlightedWord(
      onTap: () => print('add'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'alternating insanity': HighlightedWord(
      onTap: () => print('alternating insanity'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'anancastic neurosis': HighlightedWord(
      onTap: () => print('anancastic neurosis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'anancastic personality': HighlightedWord(
      onTap: () => print('anancastic personality'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'anankastic personality': HighlightedWord(
      onTap: () => print('anankastic personality'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'anorectic': HighlightedWord(
      onTap: () => print('anorectic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'apsergers': HighlightedWord(
      onTap: () => print('apsergers'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'asberger': HighlightedWord(
      onTap: () => print('asberger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'asburger': HighlightedWord(
      onTap: () => print('asburger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'aspberger': HighlightedWord(
      onTap: () => print('aspberger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'asperger': HighlightedWord(
      onTap: () => print('asperger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'aspergian': HighlightedWord(
      onTap: () => print('aspergian'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'aspergic': HighlightedWord(
      onTap: () => print('aspergic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'aspie': HighlightedWord(
      onTap: () => print('aspie'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'aspurger': HighlightedWord(
      onTap: () => print('aspurger'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'deppression': HighlightedWord(
      onTap: () => print('deppression'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bolemia': HighlightedWord(
      onTap: () => print('bolemia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'diagnos': HighlightedWord(
      onTap: () => print('diagnos'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'o.c.d.': HighlightedWord(
      onTap: () => print('o.c.d.'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'pipolar': HighlightedWord(
      onTap: () => print('pipolar'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'rapid cycling': HighlightedWord(
      onTap: () => print('rapid cycling'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'rumination': HighlightedWord(
      onTap: () => print('rumination'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'schiizophrenia': HighlightedWord(
      onTap: () => print('schiizophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'schitzo': HighlightedWord(
      onTap: () => print('schitzo'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'schyzophrenia': HighlightedWord(
      onTap: () => print('schyzophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'shizophrenia': HighlightedWord(
      onTap: () => print('shizophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'shizophrenic': HighlightedWord(
      onTap: () => print('shizophrenic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'skitsafrantic': HighlightedWord(
      onTap: () => print('skitsafrantic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'skitzafrenic': HighlightedWord(
      onTap: () => print('skitzafrenic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'skitzophrenia': HighlightedWord(
      onTap: () => print('skitzophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'tricho-tillomania': HighlightedWord(
      onTap: () => print('tricho-tillomania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'trichollomania': HighlightedWord(
      onTap: () => print('trichollomania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'trichotilimania': HighlightedWord(
      onTap: () => print('trichotilimania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'trichotillomania': HighlightedWord(
      onTap: () => print('trichotillomania'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'trichotillomannia': HighlightedWord(
      onTap: () => print('trichotillomannia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'trichotillosis': HighlightedWord(
      onTap: () => print('trichotillosis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'scizophrenia': HighlightedWord(
      onTap: () => print('scizophrenia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dpression': HighlightedWord(
      onTap: () => print('dpression'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dual-form insanity': HighlightedWord(
      onTap: () => print('dual-form insanity'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dysthemia': HighlightedWord(
      onTap: () => print('dysthemia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dysthimia': HighlightedWord(
      onTap: () => print('dysthimia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dysthymic': HighlightedWord(
      onTap: () => print('dysthymic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'distimea': HighlightedWord(
      onTap: () => print('distimea'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dystimea': HighlightedWord(
      onTap: () => print('dystimea'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'disthymia': HighlightedWord(
      onTap: () => print('disthymia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dipolar': HighlightedWord(
      onTap: () => print('dipolar'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'enxiety': HighlightedWord(
      onTap: () => print('enxiety'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hysterical neurosis': HighlightedWord(
      onTap: () => print('hysterical neurosis'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'insanity of double form': HighlightedWord(
      onTap: () => print('insanity of double form'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dystimia': HighlightedWord(
      onTap: () => print('dystimia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'distimia': HighlightedWord(
      onTap: () => print('distimia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'eating disord': HighlightedWord(
      onTap: () => print('eating disord'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bulimia': HighlightedWord(
      onTap: () => print('bulimia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bulimic': HighlightedWord(
      onTap: () => print('bulimic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'anorexi': HighlightedWord(
      onTap: () => print('anorexi'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cyclothymic': HighlightedWord(
      onTap: () => print('cyclothymic'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'merycism': HighlightedWord(
      onTap: () => print('merycism'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'llpdd': HighlightedWord(
      onTap: () => print('llpdd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'excoriation': HighlightedWord(
      onTap: () => print('excoriation'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'do not deserve to': HighlightedWord(
      onTap: () => print('do not deserve to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'social anxie': HighlightedWord(
      onTap: () => print('social anxie'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'mental disease': HighlightedWord(
      onTap: () => print('mental disease'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'kill themselves': HighlightedWord(
      onTap: () => print('kill themselves'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'mentally ill': HighlightedWord(
      onTap: () => print('mentally ill'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'mental health': HighlightedWord(
      onTap: () => print('mental health'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'adhd': HighlightedWord(
      onTap: () => print('adhd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'anxiety': HighlightedWord(
      onTap: () => print('anxiety'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ocd': HighlightedWord(
      onTap: () => print('ocd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ptsd': HighlightedWord(
      onTap: () => print('ptsd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ptsr': HighlightedWord(
      onTap: () => print('ptsr'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ptss': HighlightedWord(
      onTap: () => print('ptss'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'schizo': HighlightedWord(
      onTap: () => print('schizo'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'depres': HighlightedWord(
      onTap: () => print('depres'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'mdd': HighlightedWord(
      onTap: () => print('mdd'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dysthymia': HighlightedWord(
      onTap: () => print('dysthymia'),
      textStyle: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    'coping': HighlightedWord(
      onTap: () => print('coping'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have felt': HighlightedWord(
      onTap: () => print('i have felt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a poem about': HighlightedWord(
      onTap: () => print('a poem about'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'important to me': HighlightedWord(
      onTap: () => print('important to me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i dont want to': HighlightedWord(
      onTap: () => print('i dont want to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'so angry': HighlightedWord(
      onTap: () => print('so angry'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dehumanizing': HighlightedWord(
      onTap: () => print('dehumanizing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cishet': HighlightedWord(
      onTap: () => print('cishet'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'trauma': HighlightedWord(
      onTap: () => print('trauma'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lot of pain': HighlightedWord(
      onTap: () => print('lot of pain'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'how are you doing': HighlightedWord(
      onTap: () => print('how are you doing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bpd': HighlightedWord(
      onTap: () => print('bpd'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'controlled': HighlightedWord(
      onTap: () => print('controlled'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ableist': HighlightedWord(
      onTap: () => print('ableist'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'suicidal': HighlightedWord(
      onTap: () => print('suicidal'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a lot to me': HighlightedWord(
      onTap: () => print('a lot to me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'break my fast': HighlightedWord(
      onTap: () => print('break my fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i can not afford': HighlightedWord(
      onTap: () => print('i can not afford'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to kill': HighlightedWord(
      onTap: () => print('want to kill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'blade': HighlightedWord(
      onTap: () => print('blade'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'counselling': HighlightedWord(
      onTap: () => print('counselling'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'b/p': HighlightedWord(
      onTap: () => print('b/p'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'disorder': HighlightedWord(
      onTap: () => print('disorder'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'harm': HighlightedWord(
      onTap: () => print('harm'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'wrists': HighlightedWord(
      onTap: () => print('wrists'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'mend': HighlightedWord(
      onTap: () => print('mend'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a friend of mine': HighlightedWord(
      onTap: () => print('a friend of mine'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'will be skinny': HighlightedWord(
      onTap: () => print('will be skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'if you ever need': HighlightedWord(
      onTap: () => print('if you ever need'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ed but': HighlightedWord(
      onTap: () => print('ed but'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i used to have': HighlightedWord(
      onTap: () => print('i used to have'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'as a child': HighlightedWord(
      onTap: () => print('as a child'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'masturbate': HighlightedWord(
      onTap: () => print('masturbate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i will never be': HighlightedWord(
      onTap: () => print('i will never be'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'voices in my': HighlightedWord(
      onTap: () => print('voices in my'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to hug': HighlightedWord(
      onTap: () => print('want to hug'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to die': HighlightedWord(
      onTap: () => print('want to die'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'getting worse': HighlightedWord(
      onTap: () => print('getting worse'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hear voices': HighlightedWord(
      onTap: () => print('hear voices'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'days clean': HighlightedWord(
      onTap: () => print('days clean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dysphoria': HighlightedWord(
      onTap: () => print('dysphoria'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'celexa': HighlightedWord(
      onTap: () => print('celexa'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'illness': HighlightedWord(
      onTap: () => print('illness'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'health issues': HighlightedWord(
      onTap: () => print('health issues'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'reach my goal': HighlightedWord(
      onTap: () => print('reach my goal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'edproblems': HighlightedWord(
      onTap: () => print('edproblems'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'they do not care': HighlightedWord(
      onTap: () => print('they do not care'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'im screaming': HighlightedWord(
      onTap: () => print('im screaming'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'run away': HighlightedWord(
      onTap: () => print('run away'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ranting': HighlightedWord(
      onTap: () => print('ranting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'citalopram': HighlightedWord(
      onTap: () => print('citalopram'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'nausea': HighlightedWord(
      onTap: () => print('nausea'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'borderline': HighlightedWord(
      onTap: () => print('borderline'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'suicide': HighlightedWord(
      onTap: () => print('suicide'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i do not give a': HighlightedWord(
      onTap: () => print('i do not give a'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have been there': HighlightedWord(
      onTap: () => print('i have been there'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'genderfluid': HighlightedWord(
      onTap: () => print('genderfluid'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'god dammit': HighlightedWord(
      onTap: () => print('god dammit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'insecure': HighlightedWord(
      onTap: () => print('insecure'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'gender identity': HighlightedWord(
      onTap: () => print('gender identity'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fed': HighlightedWord(
      onTap: () => print('fed'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'modelling': HighlightedWord(
      onTap: () => print('modelling'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'the loss of': HighlightedWord(
      onTap: () => print('the loss of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am sorry that': HighlightedWord(
      onTap: () => print('i am sorry that'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sorry for being': HighlightedWord(
      onTap: () => print('sorry for being'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'kill myself': HighlightedWord(
      onTap: () => print('kill myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'diseases': HighlightedWord(
      onTap: () => print('diseases'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'unbearable': HighlightedWord(
      onTap: () => print('unbearable'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'number on the scale': HighlightedWord(
      onTap: () => print('number on the scale'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'edprobs': HighlightedWord(
      onTap: () => print('edprobs'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'okay and': HighlightedWord(
      onTap: () => print('okay and'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'no one would': HighlightedWord(
      onTap: () => print('no one would'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to die in': HighlightedWord(
      onTap: () => print('to die in'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i give up': HighlightedWord(
      onTap: () => print('i give up'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'horrid': HighlightedWord(
      onTap: () => print('horrid'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sexually': HighlightedWord(
      onTap: () => print('sexually'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ill people': HighlightedWord(
      onTap: () => print('ill people'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'effects': HighlightedWord(
      onTap: () => print('effects'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'and that i': HighlightedWord(
      onTap: () => print('and that i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'need to talk': HighlightedWord(
      onTap: () => print('need to talk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'relapsing': HighlightedWord(
      onTap: () => print('relapsing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'emo': HighlightedWord(
      onTap: () => print('emo'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am sorry for': HighlightedWord(
      onTap: () => print('i am sorry for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a cis': HighlightedWord(
      onTap: () => print('a cis'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hipbones': HighlightedWord(
      onTap: () => print('hipbones'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'wish i was dead': HighlightedWord(
      onTap: () => print('wish i was dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'deal with it': HighlightedWord(
      onTap: () => print('deal with it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'getting bad again': HighlightedWord(
      onTap: () => print('getting bad again'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel sick': HighlightedWord(
      onTap: () => print('feel sick'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'grieving': HighlightedWord(
      onTap: () => print('grieving'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'thinspo': HighlightedWord(
      onTap: () => print('thinspo'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'now i want to': HighlightedWord(
      onTap: () => print('now i want to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am so sick': HighlightedWord(
      onTap: () => print('i am so sick'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bothered': HighlightedWord(
      onTap: () => print('bothered'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'admitted': HighlightedWord(
      onTap: () => print('admitted'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'prescribed': HighlightedWord(
      onTap: () => print('prescribed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'scars': HighlightedWord(
      onTap: () => print('scars'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'abusive': HighlightedWord(
      onTap: () => print('abusive'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i was a kid': HighlightedWord(
      onTap: () => print('i was a kid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'stereotype': HighlightedWord(
      onTap: () => print('stereotype'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'veteran': HighlightedWord(
      onTap: () => print('veteran'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i stan': HighlightedWord(
      onTap: () => print('i stan'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'going to try and': HighlightedWord(
      onTap: () => print('going to try and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight now': HighlightedWord(
      onTap: () => print('weight now'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'outpatient': HighlightedWord(
      onTap: () => print('outpatient'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'really sad': HighlightedWord(
      onTap: () => print('really sad'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a victim': HighlightedWord(
      onTap: () => print('a victim'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'puking': HighlightedWord(
      onTap: () => print('puking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dizzy': HighlightedWord(
      onTap: () => print('dizzy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'anal': HighlightedWord(
      onTap: () => print('anal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am fasting': HighlightedWord(
      onTap: () => print('am fasting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weeks clean': HighlightedWord(
      onTap: () => print('weeks clean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my existence': HighlightedWord(
      onTap: () => print('my existence'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'trigger': HighlightedWord(
      onTap: () => print('trigger'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not racist': HighlightedWord(
      onTap: () => print('not racist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'irl friends': HighlightedWord(
      onTap: () => print('irl friends'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'mental hospital': HighlightedWord(
      onTap: () => print('mental hospital'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'manic': HighlightedWord(
      onTap: () => print('manic'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'it is racist': HighlightedWord(
      onTap: () => print('it is racist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hearing voices': HighlightedWord(
      onTap: () => print('hearing voices'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'survivor': HighlightedWord(
      onTap: () => print('survivor'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i totally get it': HighlightedWord(
      onTap: () => print('i totally get it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'oppressed': HighlightedWord(
      onTap: () => print('oppressed'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'calories but': HighlightedWord(
      onTap: () => print('calories but'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ednos': HighlightedWord(
      onTap: () => print('ednos'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'intersectional': HighlightedWord(
      onTap: () => print('intersectional'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am scared': HighlightedWord(
      onTap: () => print('i am scared'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'wanting to die': HighlightedWord(
      onTap: () => print('wanting to die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'stains': HighlightedWord(
      onTap: () => print('stains'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sorry i have not been': HighlightedWord(
      onTap: () => print('sorry i have not been'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'all food': HighlightedWord(
      onTap: () => print('all food'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to help': HighlightedWord(
      onTap: () => print('want to help'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'afraid that': HighlightedWord(
      onTap: () => print('afraid that'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'tense': HighlightedWord(
      onTap: () => print('tense'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'worthless': HighlightedWord(
      onTap: () => print('worthless'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'much xx': HighlightedWord(
      onTap: () => print('much xx'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel better soon': HighlightedWord(
      onTap: () => print('feel better soon'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'and never wake up': HighlightedWord(
      onTap: () => print('and never wake up'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'have to deal with': HighlightedWord(
      onTap: () => print('have to deal with'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'the voices in': HighlightedWord(
      onTap: () => print('the voices in'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not alone': HighlightedWord(
      onTap: () => print('not alone'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'masturbating': HighlightedWord(
      onTap: () => print('masturbating'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'gendered': HighlightedWord(
      onTap: () => print('gendered'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'picslip': HighlightedWord(
      onTap: () => print('picslip'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'love xx': HighlightedWord(
      onTap: () => print('love xx'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'gives a shit': HighlightedWord(
      onTap: () => print('gives a shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'effexor': HighlightedWord(
      onTap: () => print('effexor'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'erotic': HighlightedWord(
      onTap: () => print('erotic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'calories for': HighlightedWord(
      onTap: () => print('calories for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'attempts': HighlightedWord(
      onTap: () => print('attempts'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'do not want to eat': HighlightedWord(
      onTap: () => print('do not want to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'was forced': HighlightedWord(
      onTap: () => print('was forced'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'offend': HighlightedWord(
      onTap: () => print('offend'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to make up for': HighlightedWord(
      onTap: () => print('to make up for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fat on my': HighlightedWord(
      onTap: () => print('fat on my'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weeb': HighlightedWord(
      onTap: () => print('weeb'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'do you think you': HighlightedWord(
      onTap: () => print('do you think you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dietician': HighlightedWord(
      onTap: () => print('dietician'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'thigh': HighlightedWord(
      onTap: () => print('thigh'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel like shit': HighlightedWord(
      onTap: () => print('feel like shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'actually crying': HighlightedWord(
      onTap: () => print('actually crying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'months clean': HighlightedWord(
      onTap: () => print('months clean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'alcoholism': HighlightedWord(
      onTap: () => print('alcoholism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to purge': HighlightedWord(
      onTap: () => print('to purge'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'where is the lie': HighlightedWord(
      onTap: () => print('where is the lie'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'shit like this': HighlightedWord(
      onTap: () => print('shit like this'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'horrifying': HighlightedWord(
      onTap: () => print('horrifying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'tendencies': HighlightedWord(
      onTap: () => print('tendencies'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my sex': HighlightedWord(
      onTap: () => print('my sex'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to hurt myself': HighlightedWord(
      onTap: () => print('to hurt myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'useless': HighlightedWord(
      onTap: () => print('useless'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'blocked me for': HighlightedWord(
      onTap: () => print('blocked me for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hid': HighlightedWord(
      onTap: () => print('hid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'wellbutrin': HighlightedWord(
      onTap: () => print('wellbutrin'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'recover': HighlightedWord(
      onTap: () => print('recover'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'vile': HighlightedWord(
      onTap: () => print('vile'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not know if i can': HighlightedWord(
      onTap: () => print('not know if i can'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fat and disgusting': HighlightedWord(
      onTap: () => print('fat and disgusting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'is bloody': HighlightedWord(
      onTap: () => print('is bloody'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hate everything': HighlightedWord(
      onTap: () => print('hate everything'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'razor': HighlightedWord(
      onTap: () => print('razor'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'guilt': HighlightedWord(
      onTap: () => print('guilt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hour fast': HighlightedWord(
      onTap: () => print('hour fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'as someone': HighlightedWord(
      onTap: () => print('as someone'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'duloxetine': HighlightedWord(
      onTap: () => print('duloxetine'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'horny': HighlightedWord(
      onTap: () => print('horny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'counsellor': HighlightedWord(
      onTap: () => print('counsellor'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not eat i': HighlightedWord(
      onTap: () => print('not eat i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel the same way': HighlightedWord(
      onTap: () => print('feel the same way'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'end my life': HighlightedWord(
      onTap: () => print('end my life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight loss': HighlightedWord(
      onTap: () => print('weight loss'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'free will': HighlightedWord(
      onTap: () => print('free will'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hallucinating': HighlightedWord(
      onTap: () => print('hallucinating'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'paranoid': HighlightedWord(
      onTap: () => print('paranoid'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel comfortable': HighlightedWord(
      onTap: () => print('feel comfortable'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'the military': HighlightedWord(
      onTap: () => print('the military'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i want him': HighlightedWord(
      onTap: () => print('i want him'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'all ok': HighlightedWord(
      onTap: () => print('all ok'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'me to kill': HighlightedWord(
      onTap: () => print('me to kill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sexuality': HighlightedWord(
      onTap: () => print('sexuality'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bodyslip': HighlightedWord(
      onTap: () => print('bodyslip'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'thinner than': HighlightedWord(
      onTap: () => print('thinner than'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'apologising': HighlightedWord(
      onTap: () => print('apologising'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'destructive': HighlightedWord(
      onTap: () => print('destructive'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'syndrome': HighlightedWord(
      onTap: () => print('syndrome'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'it is why i': HighlightedWord(
      onTap: () => print('it is why i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'orgasm': HighlightedWord(
      onTap: () => print('orgasm'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not purge': HighlightedWord(
      onTap: () => print('not purge'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'disgusted with myself': HighlightedWord(
      onTap: () => print('disgusted with myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'damage': HighlightedWord(
      onTap: () => print('damage'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cannibal': HighlightedWord(
      onTap: () => print('cannibal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'wanker': HighlightedWord(
      onTap: () => print('wanker'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'before i was': HighlightedWord(
      onTap: () => print('before i was'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sorry to hear that': HighlightedWord(
      onTap: () => print('sorry to hear that'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'it hurts so much': HighlightedWord(
      onTap: () => print('it hurts so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'intersex': HighlightedWord(
      onTap: () => print('intersex'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'broke my fast': HighlightedWord(
      onTap: () => print('broke my fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hope you are well': HighlightedWord(
      onTap: () => print('hope you are well'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hope you are ok': HighlightedWord(
      onTap: () => print('hope you are ok'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'problematic': HighlightedWord(
      onTap: () => print('problematic'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'identifying as': HighlightedWord(
      onTap: () => print('identifying as'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'so skinny and': HighlightedWord(
      onTap: () => print('so skinny and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'criticising': HighlightedWord(
      onTap: () => print('criticising'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'disappear': HighlightedWord(
      onTap: () => print('disappear'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'manipulating': HighlightedWord(
      onTap: () => print('manipulating'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'unstable': HighlightedWord(
      onTap: () => print('unstable'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am such a fat': HighlightedWord(
      onTap: () => print('am such a fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'our bodies': HighlightedWord(
      onTap: () => print('our bodies'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'no one likes me': HighlightedWord(
      onTap: () => print('no one likes me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'helped me a lot': HighlightedWord(
      onTap: () => print('helped me a lot'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i would feel': HighlightedWord(
      onTap: () => print('i would feel'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'vaginas': HighlightedWord(
      onTap: () => print('vaginas'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'treatment': HighlightedWord(
      onTap: () => print('treatment'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'insulted': HighlightedWord(
      onTap: () => print('insulted'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'underweight': HighlightedWord(
      onTap: () => print('underweight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'over calories': HighlightedWord(
      onTap: () => print('over calories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my mental': HighlightedWord(
      onTap: () => print('my mental'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'injection': HighlightedWord(
      onTap: () => print('injection'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'drained': HighlightedWord(
      onTap: () => print('drained'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'isolated': HighlightedWord(
      onTap: () => print('isolated'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sorrow': HighlightedWord(
      onTap: () => print('sorrow'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cuts': HighlightedWord(
      onTap: () => print('cuts'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight i will': HighlightedWord(
      onTap: () => print('weight i will'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'compassion': HighlightedWord(
      onTap: () => print('compassion'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'go to the hospital': HighlightedWord(
      onTap: () => print('go to the hospital'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'what i am going': HighlightedWord(
      onTap: () => print('what i am going'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'rough day': HighlightedWord(
      onTap: () => print('rough day'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'esteem': HighlightedWord(
      onTap: () => print('esteem'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'purged': HighlightedWord(
      onTap: () => print('purged'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'kill him': HighlightedWord(
      onTap: () => print('kill him'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not available': HighlightedWord(
      onTap: () => print('not available'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'threatening': HighlightedWord(
      onTap: () => print('threatening'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'misogynist': HighlightedWord(
      onTap: () => print('misogynist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'into my fast': HighlightedWord(
      onTap: () => print('into my fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'oppression': HighlightedWord(
      onTap: () => print('oppression'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'shrink': HighlightedWord(
      onTap: () => print('shrink'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have not spoken to': HighlightedWord(
      onTap: () => print('i have not spoken to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'voices are': HighlightedWord(
      onTap: () => print('voices are'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'collarbones': HighlightedWord(
      onTap: () => print('collarbones'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'vulnerable': HighlightedWord(
      onTap: () => print('vulnerable'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'inpatient': HighlightedWord(
      onTap: () => print('inpatient'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'posh': HighlightedWord(
      onTap: () => print('posh'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'underage': HighlightedWord(
      onTap: () => print('underage'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i can not bring myself': HighlightedWord(
      onTap: () => print('i can not bring myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have lost': HighlightedWord(
      onTap: () => print('i have lost'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hallucinations': HighlightedWord(
      onTap: () => print('hallucinations'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to get better': HighlightedWord(
      onTap: () => print('want to get better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'psych': HighlightedWord(
      onTap: () => print('psych'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'healing': HighlightedWord(
      onTap: () => print('healing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cals': HighlightedWord(
      onTap: () => print('cals'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i was a teenager': HighlightedWord(
      onTap: () => print('i was a teenager'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i need to lose': HighlightedWord(
      onTap: () => print('i need to lose'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'nostalgic': HighlightedWord(
      onTap: () => print('nostalgic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'pansexual': HighlightedWord(
      onTap: () => print('pansexual'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cries': HighlightedWord(
      onTap: () => print('cries'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'rapist': HighlightedWord(
      onTap: () => print('rapist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'soz': HighlightedWord(
      onTap: () => print('soz'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lowest weight': HighlightedWord(
      onTap: () => print('lowest weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'the feels': HighlightedWord(
      onTap: () => print('the feels'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'racists': HighlightedWord(
      onTap: () => print('racists'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'and apparently': HighlightedWord(
      onTap: () => print('and apparently'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'that feel when': HighlightedWord(
      onTap: () => print('that feel when'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'purging': HighlightedWord(
      onTap: () => print('purging'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i used to love': HighlightedWord(
      onTap: () => print('i used to love'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'overwhelming': HighlightedWord(
      onTap: () => print('overwhelming'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'toxic': HighlightedWord(
      onTap: () => print('toxic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'rants': HighlightedWord(
      onTap: () => print('rants'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'doxycycline': HighlightedWord(
      onTap: () => print('doxycycline'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hurtful': HighlightedWord(
      onTap: () => print('hurtful'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'resist': HighlightedWord(
      onTap: () => print('resist'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ate so much today': HighlightedWord(
      onTap: () => print('ate so much today'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fear food': HighlightedWord(
      onTap: () => print('fear food'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sad all the time': HighlightedWord(
      onTap: () => print('sad all the time'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i cut': HighlightedWord(
      onTap: () => print('i cut'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'vent': HighlightedWord(
      onTap: () => print('vent'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'empathy': HighlightedWord(
      onTap: () => print('empathy'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'insomnia': HighlightedWord(
      onTap: () => print('insomnia'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to live anymore': HighlightedWord(
      onTap: () => print('to live anymore'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'seroquel': HighlightedWord(
      onTap: () => print('seroquel'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'grave': HighlightedWord(
      onTap: () => print('grave'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'theories': HighlightedWord(
      onTap: () => print('theories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fasted': HighlightedWord(
      onTap: () => print('fasted'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have been feeling': HighlightedWord(
      onTap: () => print('i have been feeling'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'endure': HighlightedWord(
      onTap: () => print('endure'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not realise': HighlightedWord(
      onTap: () => print('not realise'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'the army': HighlightedWord(
      onTap: () => print('the army'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'the bottom of the': HighlightedWord(
      onTap: () => print('the bottom of the'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hope i die': HighlightedWord(
      onTap: () => print('hope i die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'restless': HighlightedWord(
      onTap: () => print('restless'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'distress': HighlightedWord(
      onTap: () => print('distress'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fetish': HighlightedWord(
      onTap: () => print('fetish'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'divorced': HighlightedWord(
      onTap: () => print('divorced'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'just got back from': HighlightedWord(
      onTap: () => print('just got back from'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not to cut': HighlightedWord(
      onTap: () => print('not to cut'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'restrict': HighlightedWord(
      onTap: () => print('restrict'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'me full': HighlightedWord(
      onTap: () => print('me full'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'stabbed': HighlightedWord(
      onTap: () => print('stabbed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'talentless': HighlightedWord(
      onTap: () => print('talentless'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lethal': HighlightedWord(
      onTap: () => print('lethal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'overdose': HighlightedWord(
      onTap: () => print('overdose'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'consent': HighlightedWord(
      onTap: () => print('consent'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hope she is ok': HighlightedWord(
      onTap: () => print('hope she is ok'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weighing myself': HighlightedWord(
      onTap: () => print('weighing myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'surgeon': HighlightedWord(
      onTap: () => print('surgeon'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'save me from myself': HighlightedWord(
      onTap: () => print('save me from myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'punish': HighlightedWord(
      onTap: () => print('punish'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'relapse': HighlightedWord(
      onTap: () => print('relapse'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'outed': HighlightedWord(
      onTap: () => print('outed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'colouring': HighlightedWord(
      onTap: () => print('colouring'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'low calorie': HighlightedWord(
      onTap: () => print('low calorie'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'near the end of': HighlightedWord(
      onTap: () => print('near the end of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'rest of my life': HighlightedWord(
      onTap: () => print('rest of my life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'care of yourself': HighlightedWord(
      onTap: () => print('care of yourself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ehat': HighlightedWord(
      onTap: () => print('ehat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'for mental': HighlightedWord(
      onTap: () => print('for mental'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a burden': HighlightedWord(
      onTap: () => print('a burden'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'when i came out': HighlightedWord(
      onTap: () => print('when i came out'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fuc': HighlightedWord(
      onTap: () => print('fuc'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'and ugh': HighlightedWord(
      onTap: () => print('and ugh'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weighed myself': HighlightedWord(
      onTap: () => print('weighed myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'failings': HighlightedWord(
      onTap: () => print('failings'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cryinf': HighlightedWord(
      onTap: () => print('cryinf'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am not worth': HighlightedWord(
      onTap: () => print('am not worth'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'health it': HighlightedWord(
      onTap: () => print('health it'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'narcissistic': HighlightedWord(
      onTap: () => print('narcissistic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'obsessive': HighlightedWord(
      onTap: () => print('obsessive'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'stigma': HighlightedWord(
      onTap: () => print('stigma'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'so fat and': HighlightedWord(
      onTap: () => print('so fat and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am sorry you': HighlightedWord(
      onTap: () => print('i am sorry you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am so stressed': HighlightedWord(
      onTap: () => print('am so stressed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a deep breath': HighlightedWord(
      onTap: () => print('a deep breath'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'pill': HighlightedWord(
      onTap: () => print('pill'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'f u c k': HighlightedWord(
      onTap: () => print('f u c k'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'harsh': HighlightedWord(
      onTap: () => print('harsh'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'what i ate': HighlightedWord(
      onTap: () => print('what i ate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'need to be skinny': HighlightedWord(
      onTap: () => print('need to be skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to love myself': HighlightedWord(
      onTap: () => print('to love myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'doctors': HighlightedWord(
      onTap: () => print('doctors'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'im so fat': HighlightedWord(
      onTap: () => print('im so fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'drink lots of water': HighlightedWord(
      onTap: () => print('drink lots of water'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'now xx': HighlightedWord(
      onTap: () => print('now xx'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'controlling': HighlightedWord(
      onTap: () => print('controlling'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'misogyny': HighlightedWord(
      onTap: () => print('misogyny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'thinspiration': HighlightedWord(
      onTap: () => print('thinspiration'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lose weight': HighlightedWord(
      onTap: () => print('lose weight'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'disturbed': HighlightedWord(
      onTap: () => print('disturbed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'panic': HighlightedWord(
      onTap: () => print('panic'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to cut but': HighlightedWord(
      onTap: () => print('to cut but'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'would kill': HighlightedWord(
      onTap: () => print('would kill'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'shaming': HighlightedWord(
      onTap: () => print('shaming'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'nudes and': HighlightedWord(
      onTap: () => print('nudes and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'it is my fault': HighlightedWord(
      onTap: () => print('it is my fault'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'angry i': HighlightedWord(
      onTap: () => print('angry i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not eaten': HighlightedWord(
      onTap: () => print('not eaten'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'refused': HighlightedWord(
      onTap: () => print('refused'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'agony': HighlightedWord(
      onTap: () => print('agony'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'whiny': HighlightedWord(
      onTap: () => print('whiny'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'terror': HighlightedWord(
      onTap: () => print('terror'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'suffer': HighlightedWord(
      onTap: () => print('suffer'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'it pisses me off': HighlightedWord(
      onTap: () => print('it pisses me off'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'does get better': HighlightedWord(
      onTap: () => print('does get better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'will never get over': HighlightedWord(
      onTap: () => print('will never get over'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i will be dead': HighlightedWord(
      onTap: () => print('i will be dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'prescription': HighlightedWord(
      onTap: () => print('prescription'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'commit': HighlightedWord(
      onTap: () => print('commit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bugging': HighlightedWord(
      onTap: () => print('bugging'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'pedophiles': HighlightedWord(
      onTap: () => print('pedophiles'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'disgrace': HighlightedWord(
      onTap: () => print('disgrace'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'intention': HighlightedWord(
      onTap: () => print('intention'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cunts': HighlightedWord(
      onTap: () => print('cunts'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'younger i': HighlightedWord(
      onTap: () => print('younger i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'chest bones': HighlightedWord(
      onTap: () => print('chest bones'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not defending': HighlightedWord(
      onTap: () => print('not defending'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sadness': HighlightedWord(
      onTap: () => print('sadness'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'smoking weed': HighlightedWord(
      onTap: () => print('smoking weed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'condition': HighlightedWord(
      onTap: () => print('condition'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'xanax': HighlightedWord(
      onTap: () => print('xanax'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'urges': HighlightedWord(
      onTap: () => print('urges'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i want to lose': HighlightedWord(
      onTap: () => print('i want to lose'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am crying so': HighlightedWord(
      onTap: () => print('i am crying so'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'appropriation is': HighlightedWord(
      onTap: () => print('appropriation is'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cutting': HighlightedWord(
      onTap: () => print('cutting'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'needle': HighlightedWord(
      onTap: () => print('needle'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'quit smoking': HighlightedWord(
      onTap: () => print('quit smoking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight and i': HighlightedWord(
      onTap: () => print('weight and i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am lbs': HighlightedWord(
      onTap: () => print('am lbs'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'realised how': HighlightedWord(
      onTap: () => print('realised how'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'labelled': HighlightedWord(
      onTap: () => print('labelled'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'swear to god i': HighlightedWord(
      onTap: () => print('swear to god i'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i need to cut': HighlightedWord(
      onTap: () => print('i need to cut'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a bad person': HighlightedWord(
      onTap: () => print('a bad person'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my weight': HighlightedWord(
      onTap: () => print('my weight'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'reject': HighlightedWord(
      onTap: () => print('reject'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'and i was like': HighlightedWord(
      onTap: () => print('and i was like'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am so worried': HighlightedWord(
      onTap: () => print('i am so worried'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hatred': HighlightedWord(
      onTap: () => print('hatred'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you are so pretty': HighlightedWord(
      onTap: () => print('you are so pretty'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dildos': HighlightedWord(
      onTap: () => print('dildos'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am still alive': HighlightedWord(
      onTap: () => print('am still alive'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'attacking': HighlightedWord(
      onTap: () => print('attacking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'apologist': HighlightedWord(
      onTap: () => print('apologist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'counting calories': HighlightedWord(
      onTap: () => print('counting calories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'loneliness': HighlightedWord(
      onTap: () => print('loneliness'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'drowning': HighlightedWord(
      onTap: () => print('drowning'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'erasure': HighlightedWord(
      onTap: () => print('erasure'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have a headache': HighlightedWord(
      onTap: () => print('i have a headache'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sexism': HighlightedWord(
      onTap: () => print('sexism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to swallow': HighlightedWord(
      onTap: () => print('to swallow'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'marks': HighlightedWord(
      onTap: () => print('marks'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'can not do this anymore': HighlightedWord(
      onTap: () => print('can not do this anymore'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'vomiting': HighlightedWord(
      onTap: () => print('vomiting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'abuse': HighlightedWord(
      onTap: () => print('abuse'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'moan': HighlightedWord(
      onTap: () => print('moan'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'femininity': HighlightedWord(
      onTap: () => print('femininity'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'please stay': HighlightedWord(
      onTap: () => print('please stay'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to be skinny': HighlightedWord(
      onTap: () => print('want to be skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'agender': HighlightedWord(
      onTap: () => print('agender'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hate life': HighlightedWord(
      onTap: () => print('hate life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'been clean': HighlightedWord(
      onTap: () => print('been clean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'intolerant': HighlightedWord(
      onTap: () => print('intolerant'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'myself to eat': HighlightedWord(
      onTap: () => print('myself to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'so alone': HighlightedWord(
      onTap: () => print('so alone'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bawling': HighlightedWord(
      onTap: () => print('bawling'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i purge': HighlightedWord(
      onTap: () => print('i purge'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'so scared': HighlightedWord(
      onTap: () => print('so scared'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'they/them': HighlightedWord(
      onTap: () => print('they/them'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'horrendous': HighlightedWord(
      onTap: () => print('horrendous'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'grin': HighlightedWord(
      onTap: () => print('grin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ableism': HighlightedWord(
      onTap: () => print('ableism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bullies': HighlightedWord(
      onTap: () => print('bullies'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'victim of': HighlightedWord(
      onTap: () => print('victim of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'alone and': HighlightedWord(
      onTap: () => print('alone and'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'anxious': HighlightedWord(
      onTap: () => print('anxious'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'androgynous': HighlightedWord(
      onTap: () => print('androgynous'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lexapro': HighlightedWord(
      onTap: () => print('lexapro'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'assure': HighlightedWord(
      onTap: () => print('assure'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'crying so much': HighlightedWord(
      onTap: () => print('crying so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my own fault': HighlightedWord(
      onTap: () => print('my own fault'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not stop crying': HighlightedWord(
      onTap: () => print('not stop crying'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'failure': HighlightedWord(
      onTap: () => print('failure'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'heroin': HighlightedWord(
      onTap: () => print('heroin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lgbt+': HighlightedWord(
      onTap: () => print('lgbt+'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'health problems': HighlightedWord(
      onTap: () => print('health problems'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'killing people': HighlightedWord(
      onTap: () => print('killing people'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'tired omg': HighlightedWord(
      onTap: () => print('tired omg'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'attacks': HighlightedWord(
      onTap: () => print('attacks'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fat pig': HighlightedWord(
      onTap: () => print('fat pig'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am fat i': HighlightedWord(
      onTap: () => print('am fat i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'im crying so': HighlightedWord(
      onTap: () => print('im crying so'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not sleeping': HighlightedWord(
      onTap: () => print('not sleeping'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel sad': HighlightedWord(
      onTap: () => print('feel sad'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'be alone': HighlightedWord(
      onTap: () => print('be alone'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hate people': HighlightedWord(
      onTap: () => print('hate people'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'drowned': HighlightedWord(
      onTap: () => print('drowned'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'too x': HighlightedWord(
      onTap: () => print('too x'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i want to cut': HighlightedWord(
      onTap: () => print('i want to cut'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'manipulate': HighlightedWord(
      onTap: () => print('manipulate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'too fat for': HighlightedWord(
      onTap: () => print('too fat for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'masturbation': HighlightedWord(
      onTap: () => print('masturbation'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'forced to eat': HighlightedWord(
      onTap: () => print('forced to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am struggling': HighlightedWord(
      onTap: () => print('am struggling'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'how hard it is': HighlightedWord(
      onTap: () => print('how hard it is'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bleed': HighlightedWord(
      onTap: () => print('bleed'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'threatened': HighlightedWord(
      onTap: () => print('threatened'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have been following': HighlightedWord(
      onTap: () => print('i have been following'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'wreck': HighlightedWord(
      onTap: () => print('wreck'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my lw': HighlightedWord(
      onTap: () => print('my lw'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have never liked': HighlightedWord(
      onTap: () => print('i have never liked'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'med': HighlightedWord(
      onTap: () => print('med'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'can get away with': HighlightedWord(
      onTap: () => print('can get away with'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'in pain': HighlightedWord(
      onTap: () => print('in pain'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to therapy': HighlightedWord(
      onTap: () => print('to therapy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'as long as they': HighlightedWord(
      onTap: () => print('as long as they'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel so much better': HighlightedWord(
      onTap: () => print('feel so much better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'pissed off': HighlightedWord(
      onTap: () => print('pissed off'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight again': HighlightedWord(
      onTap: () => print('weight again'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'still struggle': HighlightedWord(
      onTap: () => print('still struggle'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'broke down': HighlightedWord(
      onTap: () => print('broke down'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'worrying': HighlightedWord(
      onTap: () => print('worrying'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'thyroid': HighlightedWord(
      onTap: () => print('thyroid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am going through': HighlightedWord(
      onTap: () => print('am going through'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am losing': HighlightedWord(
      onTap: () => print('am losing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'exploited': HighlightedWord(
      onTap: () => print('exploited'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'this is too much': HighlightedWord(
      onTap: () => print('this is too much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'give a shit': HighlightedWord(
      onTap: () => print('give a shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to hate me': HighlightedWord(
      onTap: () => print('to hate me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my wrist': HighlightedWord(
      onTap: () => print('my wrist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'escape': HighlightedWord(
      onTap: () => print('escape'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i self': HighlightedWord(
      onTap: () => print('i self'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'have gained so': HighlightedWord(
      onTap: () => print('have gained so'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'measurements': HighlightedWord(
      onTap: () => print('measurements'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'and i am trying': HighlightedWord(
      onTap: () => print('and i am trying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'reason to live': HighlightedWord(
      onTap: () => print('reason to live'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'do not cut': HighlightedWord(
      onTap: () => print('do not cut'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'made me eat': HighlightedWord(
      onTap: () => print('made me eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'deserve to die': HighlightedWord(
      onTap: () => print('deserve to die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bmi': HighlightedWord(
      onTap: () => print('bmi'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am disgusting': HighlightedWord(
      onTap: () => print('am disgusting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'laxative': HighlightedWord(
      onTap: () => print('laxative'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'got my period': HighlightedWord(
      onTap: () => print('got my period'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my own skin': HighlightedWord(
      onTap: () => print('my own skin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'gained weight': HighlightedWord(
      onTap: () => print('gained weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i actually feel': HighlightedWord(
      onTap: () => print('i actually feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'let me die': HighlightedWord(
      onTap: () => print('let me die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not :)': HighlightedWord(
      onTap: () => print('not :)'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hate myself': HighlightedWord(
      onTap: () => print('hate myself'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bullied': HighlightedWord(
      onTap: () => print('bullied'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fat it is': HighlightedWord(
      onTap: () => print('fat it is'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'look in the mirror': HighlightedWord(
      onTap: () => print('look in the mirror'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel so fat': HighlightedWord(
      onTap: () => print('feel so fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'flesh': HighlightedWord(
      onTap: () => print('flesh'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'strain': HighlightedWord(
      onTap: () => print('strain'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am still fat': HighlightedWord(
      onTap: () => print('am still fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight does': HighlightedWord(
      onTap: () => print('weight does'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'get what you mean': HighlightedWord(
      onTap: () => print('get what you mean'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'abdominal': HighlightedWord(
      onTap: () => print('abdominal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you feel better': HighlightedWord(
      onTap: () => print('you feel better'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'died in': HighlightedWord(
      onTap: () => print('died in'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'raping': HighlightedWord(
      onTap: () => print('raping'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'self-care': HighlightedWord(
      onTap: () => print('self-care'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'purge but': HighlightedWord(
      onTap: () => print('purge but'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel happy': HighlightedWord(
      onTap: () => print('feel happy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'gutted': HighlightedWord(
      onTap: () => print('gutted'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'devastated': HighlightedWord(
      onTap: () => print('devastated'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel shit': HighlightedWord(
      onTap: () => print('feel shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'scales': HighlightedWord(
      onTap: () => print('scales'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am shit': HighlightedWord(
      onTap: () => print('i am shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'it makes me feel': HighlightedWord(
      onTap: () => print('it makes me feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'water fast': HighlightedWord(
      onTap: () => print('water fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am a fat': HighlightedWord(
      onTap: () => print('i am a fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'whereas': HighlightedWord(
      onTap: () => print('whereas'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my ed': HighlightedWord(
      onTap: () => print('my ed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bloat': HighlightedWord(
      onTap: () => print('bloat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i hate my life': HighlightedWord(
      onTap: () => print('i hate my life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a waste of space': HighlightedWord(
      onTap: () => print('a waste of space'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'clean from': HighlightedWord(
      onTap: () => print('clean from'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'innocence': HighlightedWord(
      onTap: () => print('innocence'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to try and sleep': HighlightedWord(
      onTap: () => print('to try and sleep'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am going to end': HighlightedWord(
      onTap: () => print('am going to end'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am not the only one': HighlightedWord(
      onTap: () => print('am not the only one'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'dizziness': HighlightedWord(
      onTap: () => print('dizziness'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'abortion': HighlightedWord(
      onTap: () => print('abortion'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'because i am fat': HighlightedWord(
      onTap: () => print('because i am fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am thin': HighlightedWord(
      onTap: () => print('am thin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'need someone to talk': HighlightedWord(
      onTap: () => print('need someone to talk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sob': HighlightedWord(
      onTap: () => print('sob'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am fat and': HighlightedWord(
      onTap: () => print('i am fat and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you will be fine': HighlightedWord(
      onTap: () => print('you will be fine'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'how fat i am': HighlightedWord(
      onTap: () => print('how fat i am'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'kill herself': HighlightedWord(
      onTap: () => print('kill herself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fraud': HighlightedWord(
      onTap: () => print('fraud'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'betrayed': HighlightedWord(
      onTap: () => print('betrayed'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'personalities': HighlightedWord(
      onTap: () => print('personalities'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fat fat': HighlightedWord(
      onTap: () => print('fat fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my hip bones': HighlightedWord(
      onTap: () => print('my hip bones'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'paranoia': HighlightedWord(
      onTap: () => print('paranoia'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'virginity': HighlightedWord(
      onTap: () => print('virginity'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not gain': HighlightedWord(
      onTap: () => print('not gain'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i cant do this': HighlightedWord(
      onTap: () => print('i cant do this'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'so sorry to': HighlightedWord(
      onTap: () => print('so sorry to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'abusing': HighlightedWord(
      onTap: () => print('abusing'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'deserve to be happy': HighlightedWord(
      onTap: () => print('deserve to be happy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to live': HighlightedWord(
      onTap: () => print('want to live'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you realise': HighlightedWord(
      onTap: () => print('you realise'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'commenting': HighlightedWord(
      onTap: () => print('commenting'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'be thin': HighlightedWord(
      onTap: () => print('be thin'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'help i': HighlightedWord(
      onTap: () => print('help i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'drop dead': HighlightedWord(
      onTap: () => print('drop dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'edgy': HighlightedWord(
      onTap: () => print('edgy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight it': HighlightedWord(
      onTap: () => print('weight it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i feel like it': HighlightedWord(
      onTap: () => print('i feel like it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'being fat': HighlightedWord(
      onTap: () => print('being fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'flashbacks': HighlightedWord(
      onTap: () => print('flashbacks'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'someone to talk to': HighlightedWord(
      onTap: () => print('someone to talk to'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sorry for your': HighlightedWord(
      onTap: () => print('sorry for your'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'haunt': HighlightedWord(
      onTap: () => print('haunt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'delusion': HighlightedWord(
      onTap: () => print('delusion'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i do not care about': HighlightedWord(
      onTap: () => print('i do not care about'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hate my body': HighlightedWord(
      onTap: () => print('hate my body'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'die right now': HighlightedWord(
      onTap: () => print('die right now'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bothering': HighlightedWord(
      onTap: () => print('bothering'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'imaginary': HighlightedWord(
      onTap: () => print('imaginary'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am just sick of': HighlightedWord(
      onTap: () => print('am just sick of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bully': HighlightedWord(
      onTap: () => print('bully'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'water weight': HighlightedWord(
      onTap: () => print('water weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am already dead': HighlightedWord(
      onTap: () => print('i am already dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'mentalhealth': HighlightedWord(
      onTap: () => print('mentalhealth'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not well': HighlightedWord(
      onTap: () => print('not well'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am so pathetic': HighlightedWord(
      onTap: () => print('i am so pathetic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'go for a walk': HighlightedWord(
      onTap: () => print('go for a walk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have been up': HighlightedWord(
      onTap: () => print('i have been up'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am trash': HighlightedWord(
      onTap: () => print('i am trash'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'void': HighlightedWord(
      onTap: () => print('void'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'safe space': HighlightedWord(
      onTap: () => print('safe space'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'do not want him to': HighlightedWord(
      onTap: () => print('do not want him to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel so ill': HighlightedWord(
      onTap: () => print('feel so ill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'it is not the same': HighlightedWord(
      onTap: () => print('it is not the same'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a piece of shit': HighlightedWord(
      onTap: () => print('a piece of shit'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i can not deal with': HighlightedWord(
      onTap: () => print('i can not deal with'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'are feeling better': HighlightedWord(
      onTap: () => print('are feeling better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'in prison': HighlightedWord(
      onTap: () => print('in prison'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lucid': HighlightedWord(
      onTap: () => print('lucid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'overweight': HighlightedWord(
      onTap: () => print('overweight'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fu ck': HighlightedWord(
      onTap: () => print('fu ck'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'veganism': HighlightedWord(
      onTap: () => print('veganism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'whining': HighlightedWord(
      onTap: () => print('whining'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'gasp': HighlightedWord(
      onTap: () => print('gasp'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'have lost weight': HighlightedWord(
      onTap: () => print('have lost weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'replying': HighlightedWord(
      onTap: () => print('replying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'consciousness': HighlightedWord(
      onTap: () => print('consciousness'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'desperation': HighlightedWord(
      onTap: () => print('desperation'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'put on weight': HighlightedWord(
      onTap: () => print('put on weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i should probably sleep': HighlightedWord(
      onTap: () => print('i should probably sleep'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fat today': HighlightedWord(
      onTap: () => print('fat today'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'im here for you': HighlightedWord(
      onTap: () => print('im here for you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'it makes me sad': HighlightedWord(
      onTap: () => print('it makes me sad'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'aggressively': HighlightedWord(
      onTap: () => print('aggressively'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'choking': HighlightedWord(
      onTap: () => print('choking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'never happened': HighlightedWord(
      onTap: () => print('never happened'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am a size': HighlightedWord(
      onTap: () => print('i am a size'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'when i reach': HighlightedWord(
      onTap: () => print('when i reach'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to feel something': HighlightedWord(
      onTap: () => print('to feel something'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'calorie intake': HighlightedWord(
      onTap: () => print('calorie intake'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'so ugly and': HighlightedWord(
      onTap: () => print('so ugly and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'any weight': HighlightedWord(
      onTap: () => print('any weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hospitalized': HighlightedWord(
      onTap: () => print('hospitalized'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'blowjob': HighlightedWord(
      onTap: () => print('blowjob'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'choked': HighlightedWord(
      onTap: () => print('choked'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'guts': HighlightedWord(
      onTap: () => print('guts'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'acid': HighlightedWord(
      onTap: () => print('acid'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'deeper': HighlightedWord(
      onTap: () => print('deeper'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i feel so sick': HighlightedWord(
      onTap: () => print('i feel so sick'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'love and care': HighlightedWord(
      onTap: () => print('love and care'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'murdering': HighlightedWord(
      onTap: () => print('murdering'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hope you feel': HighlightedWord(
      onTap: () => print('hope you feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'kilos': HighlightedWord(
      onTap: () => print('kilos'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'self hate': HighlightedWord(
      onTap: () => print('self hate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a few years ago': HighlightedWord(
      onTap: () => print('a few years ago'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hateful': HighlightedWord(
      onTap: () => print('hateful'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fat i can': HighlightedWord(
      onTap: () => print('fat i can'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'pro ana': HighlightedWord(
      onTap: () => print('pro ana'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'shitting': HighlightedWord(
      onTap: () => print('shitting'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'violent': HighlightedWord(
      onTap: () => print('violent'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'eds': HighlightedWord(
      onTap: () => print('eds'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'people i love': HighlightedWord(
      onTap: () => print('people i love'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cum': HighlightedWord(
      onTap: () => print('cum'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'body so much': HighlightedWord(
      onTap: () => print('body so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my metabolism': HighlightedWord(
      onTap: () => print('my metabolism'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'this is so ugly': HighlightedWord(
      onTap: () => print('this is so ugly'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'deprivation': HighlightedWord(
      onTap: () => print('deprivation'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cryig': HighlightedWord(
      onTap: () => print('cryig'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'threats': HighlightedWord(
      onTap: () => print('threats'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fat like': HighlightedWord(
      onTap: () => print('fat like'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to talk about it': HighlightedWord(
      onTap: () => print('to talk about it'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'be more active': HighlightedWord(
      onTap: () => print('be more active'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am so fat': HighlightedWord(
      onTap: () => print('am so fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'in danger': HighlightedWord(
      onTap: () => print('in danger'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'clingy': HighlightedWord(
      onTap: () => print('clingy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lucifer': HighlightedWord(
      onTap: () => print('lucifer'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feel so disgusting': HighlightedWord(
      onTap: () => print('feel so disgusting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i felt like i': HighlightedWord(
      onTap: () => print('i felt like i'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'would like to talk': HighlightedWord(
      onTap: () => print('would like to talk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'more calories': HighlightedWord(
      onTap: () => print('more calories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i will never forget': HighlightedWord(
      onTap: () => print('i will never forget'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'have loads': HighlightedWord(
      onTap: () => print('have loads'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'misunderstanding': HighlightedWord(
      onTap: () => print('misunderstanding'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not belong': HighlightedWord(
      onTap: () => print('not belong'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weigh myself': HighlightedWord(
      onTap: () => print('weigh myself'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'grief': HighlightedWord(
      onTap: () => print('grief'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'struggled with': HighlightedWord(
      onTap: () => print('struggled with'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to hurt': HighlightedWord(
      onTap: () => print('want to hurt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fatter': HighlightedWord(
      onTap: () => print('fatter'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'so cute im': HighlightedWord(
      onTap: () => print('so cute im'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'your ed': HighlightedWord(
      onTap: () => print('your ed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not skinny': HighlightedWord(
      onTap: () => print('not skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'and suddenly i': HighlightedWord(
      onTap: () => print('and suddenly i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'insults': HighlightedWord(
      onTap: () => print('insults'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'for nudes': HighlightedWord(
      onTap: () => print('for nudes'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i wanna die': HighlightedWord(
      onTap: () => print('i wanna die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not felt': HighlightedWord(
      onTap: () => print('not felt'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'queer': HighlightedWord(
      onTap: () => print('queer'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'spectrum': HighlightedWord(
      onTap: () => print('spectrum'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'patches': HighlightedWord(
      onTap: () => print('patches'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'scared i': HighlightedWord(
      onTap: () => print('scared i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'harass': HighlightedWord(
      onTap: () => print('harass'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cut but i': HighlightedWord(
      onTap: () => print('cut but i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'disabled': HighlightedWord(
      onTap: () => print('disabled'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'gain weight and': HighlightedWord(
      onTap: () => print('gain weight and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feels that way': HighlightedWord(
      onTap: () => print('feels that way'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'physical health': HighlightedWord(
      onTap: () => print('physical health'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am so sad and': HighlightedWord(
      onTap: () => print('am so sad and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'how skinny': HighlightedWord(
      onTap: () => print('how skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight this': HighlightedWord(
      onTap: () => print('weight this'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cellulite': HighlightedWord(
      onTap: () => print('cellulite'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'rest of his life': HighlightedWord(
      onTap: () => print('rest of his life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'breakdown': HighlightedWord(
      onTap: () => print('breakdown'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'blue hair': HighlightedWord(
      onTap: () => print('blue hair'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'the victim': HighlightedWord(
      onTap: () => print('the victim'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'nightmares': HighlightedWord(
      onTap: () => print('nightmares'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'asexual': HighlightedWord(
      onTap: () => print('asexual'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'healed': HighlightedWord(
      onTap: () => print('healed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'forgiveness': HighlightedWord(
      onTap: () => print('forgiveness'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'makes me cry': HighlightedWord(
      onTap: () => print('makes me cry'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'intercourse': HighlightedWord(
      onTap: () => print('intercourse'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'in the mirror i': HighlightedWord(
      onTap: () => print('in the mirror i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'myfitnesspal': HighlightedWord(
      onTap: () => print('myfitnesspal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hot water bottle': HighlightedWord(
      onTap: () => print('hot water bottle'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'mourning': HighlightedWord(
      onTap: () => print('mourning'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight at': HighlightedWord(
      onTap: () => print('weight at'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am so tired': HighlightedWord(
      onTap: () => print('i am so tired'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'starve': HighlightedWord(
      onTap: () => print('starve'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'prostate': HighlightedWord(
      onTap: () => print('prostate'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'calories i': HighlightedWord(
      onTap: () => print('calories i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i should be happy': HighlightedWord(
      onTap: () => print('i should be happy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not blame yourself': HighlightedWord(
      onTap: () => print('not blame yourself'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'tried to kill': HighlightedWord(
      onTap: () => print('tried to kill'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'my death': HighlightedWord(
      onTap: () => print('my death'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'stained': HighlightedWord(
      onTap: () => print('stained'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i want to sleep': HighlightedWord(
      onTap: () => print('i want to sleep'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'assault': HighlightedWord(
      onTap: () => print('assault'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'very sad and': HighlightedWord(
      onTap: () => print('very sad and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'painkillers': HighlightedWord(
      onTap: () => print('painkillers'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'is skinny': HighlightedWord(
      onTap: () => print('is skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'amazingly': HighlightedWord(
      onTap: () => print('amazingly'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'unwell': HighlightedWord(
      onTap: () => print('unwell'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'imagining': HighlightedWord(
      onTap: () => print('imagining'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'and purge': HighlightedWord(
      onTap: () => print('and purge'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'accusing': HighlightedWord(
      onTap: () => print('accusing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'all women': HighlightedWord(
      onTap: () => print('all women'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'like calories': HighlightedWord(
      onTap: () => print('like calories'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to talk': HighlightedWord(
      onTap: () => print('want to talk'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'apologizing': HighlightedWord(
      onTap: () => print('apologizing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'racism': HighlightedWord(
      onTap: () => print('racism'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to help you': HighlightedWord(
      onTap: () => print('to help you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'have to fight': HighlightedWord(
      onTap: () => print('have to fight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'scaring me': HighlightedWord(
      onTap: () => print('scaring me'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'upsetting': HighlightedWord(
      onTap: () => print('upsetting'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'misgender': HighlightedWord(
      onTap: () => print('misgender'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'this disease': HighlightedWord(
      onTap: () => print('this disease'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'rape': HighlightedWord(
      onTap: () => print('rape'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'eat nothing': HighlightedWord(
      onTap: () => print('eat nothing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i can not handle this': HighlightedWord(
      onTap: () => print('i can not handle this'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am drinking': HighlightedWord(
      onTap: () => print('i am drinking'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i wanna hug': HighlightedWord(
      onTap: () => print('i wanna hug'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'own life': HighlightedWord(
      onTap: () => print('own life'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cope': HighlightedWord(
      onTap: () => print('cope'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'skinnier': HighlightedWord(
      onTap: () => print('skinnier'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i would be dead': HighlightedWord(
      onTap: () => print('i would be dead'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'abnormal': HighlightedWord(
      onTap: () => print('abnormal'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'aroused': HighlightedWord(
      onTap: () => print('aroused'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'calming': HighlightedWord(
      onTap: () => print('calming'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'purge and': HighlightedWord(
      onTap: () => print('purge and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'abandon': HighlightedWord(
      onTap: () => print('abandon'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to look after': HighlightedWord(
      onTap: () => print('to look after'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to get help': HighlightedWord(
      onTap: () => print('to get help'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'been crying': HighlightedWord(
      onTap: () => print('been crying'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'swallowing': HighlightedWord(
      onTap: () => print('swallowing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'paxil': HighlightedWord(
      onTap: () => print('paxil'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'perceived': HighlightedWord(
      onTap: () => print('perceived'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'eaten so much': HighlightedWord(
      onTap: () => print('eaten so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'broken i am': HighlightedWord(
      onTap: () => print('broken i am'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'a rough': HighlightedWord(
      onTap: () => print('a rough'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'murderer': HighlightedWord(
      onTap: () => print('murderer'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'make me eat': HighlightedWord(
      onTap: () => print('make me eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fat again': HighlightedWord(
      onTap: () => print('fat again'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am afraid to': HighlightedWord(
      onTap: () => print('i am afraid to'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'made me feel': HighlightedWord(
      onTap: () => print('made me feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'ded': HighlightedWord(
      onTap: () => print('ded'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'the weight i': HighlightedWord(
      onTap: () => print('the weight i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight but i': HighlightedWord(
      onTap: () => print('weight but i'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'liquid fast': HighlightedWord(
      onTap: () => print('liquid fast'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'body posi': HighlightedWord(
      onTap: () => print('body posi'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you are lovely': HighlightedWord(
      onTap: () => print('you are lovely'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'trans': HighlightedWord(
      onTap: () => print('trans'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'be skinny and': HighlightedWord(
      onTap: () => print('be skinny and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want to cry': HighlightedWord(
      onTap: () => print('want to cry'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'weight since': HighlightedWord(
      onTap: () => print('weight since'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to jump off a': HighlightedWord(
      onTap: () => print('to jump off a'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am too fat': HighlightedWord(
      onTap: () => print('am too fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i feel sorry for': HighlightedWord(
      onTap: () => print('i feel sorry for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'want a hug': HighlightedWord(
      onTap: () => print('want a hug'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'oppressing': HighlightedWord(
      onTap: () => print('oppressing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fasting and': HighlightedWord(
      onTap: () => print('fasting and'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'terrified': HighlightedWord(
      onTap: () => print('terrified'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'puke': HighlightedWord(
      onTap: () => print('puke'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'so much weight': HighlightedWord(
      onTap: () => print('so much weight'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'on the edge of': HighlightedWord(
      onTap: () => print('on the edge of'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am still not over': HighlightedWord(
      onTap: () => print('am still not over'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'and i just feel': HighlightedWord(
      onTap: () => print('and i just feel'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'fearless': HighlightedWord(
      onTap: () => print('fearless'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lose more': HighlightedWord(
      onTap: () => print('lose more'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'but i can not eat': HighlightedWord(
      onTap: () => print('but i can not eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'how to explain': HighlightedWord(
      onTap: () => print('how to explain'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'not hate you': HighlightedWord(
      onTap: () => print('not hate you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'wanted to die': HighlightedWord(
      onTap: () => print('wanted to die'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'erection': HighlightedWord(
      onTap: () => print('erection'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'furiously': HighlightedWord(
      onTap: () => print('furiously'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sjw': HighlightedWord(
      onTap: () => print('sjw'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'have lost so much': HighlightedWord(
      onTap: () => print('have lost so much'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i wanna kill': HighlightedWord(
      onTap: () => print('i wanna kill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sedated': HighlightedWord(
      onTap: () => print('sedated'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'vibrator': HighlightedWord(
      onTap: () => print('vibrator'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'realise it': HighlightedWord(
      onTap: () => print('realise it'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'beat the shit out': HighlightedWord(
      onTap: () => print('beat the shit out'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'capitalist': HighlightedWord(
      onTap: () => print('capitalist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'in the hospital for': HighlightedWord(
      onTap: () => print('in the hospital for'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bi': HighlightedWord(
      onTap: () => print('bi'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cymbalta': HighlightedWord(
      onTap: () => print('cymbalta'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'porn video': HighlightedWord(
      onTap: () => print('porn video'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'much fat': HighlightedWord(
      onTap: () => print('much fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'offensive': HighlightedWord(
      onTap: () => print('offensive'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'myself in the mirror': HighlightedWord(
      onTap: () => print('myself in the mirror'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am going to kill': HighlightedWord(
      onTap: () => print('am going to kill'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cringing': HighlightedWord(
      onTap: () => print('cringing'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'the navy': HighlightedWord(
      onTap: () => print('the navy'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'bleach': HighlightedWord(
      onTap: () => print('bleach'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'afghanistan': HighlightedWord(
      onTap: () => print('afghanistan'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'they have no idea': HighlightedWord(
      onTap: () => print('they have no idea'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'severely': HighlightedWord(
      onTap: () => print('severely'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'am skinny': HighlightedWord(
      onTap: () => print('am skinny'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hetero': HighlightedWord(
      onTap: () => print('hetero'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'an ed': HighlightedWord(
      onTap: () => print('an ed'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'constipation': HighlightedWord(
      onTap: () => print('constipation'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'pains': HighlightedWord(
      onTap: () => print('pains'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am afraid of': HighlightedWord(
      onTap: () => print('i am afraid of'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'curiosity': HighlightedWord(
      onTap: () => print('curiosity'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'was in hospital': HighlightedWord(
      onTap: () => print('was in hospital'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hysterically': HighlightedWord(
      onTap: () => print('hysterically'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'torture': HighlightedWord(
      onTap: () => print('torture'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'to stop myself from': HighlightedWord(
      onTap: () => print('to stop myself from'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'coward': HighlightedWord(
      onTap: () => print('coward'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'it was in the': HighlightedWord(
      onTap: () => print('it was in the'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'boobs': HighlightedWord(
      onTap: () => print('boobs'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'despite': HighlightedWord(
      onTap: () => print('despite'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lunatic': HighlightedWord(
      onTap: () => print('lunatic'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'wiped': HighlightedWord(
      onTap: () => print('wiped'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am a mess': HighlightedWord(
      onTap: () => print('i am a mess'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'deserved better': HighlightedWord(
      onTap: () => print('deserved better'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'body image': HighlightedWord(
      onTap: () => print('body image'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cruel': HighlightedWord(
      onTap: () => print('cruel'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'paracetamol': HighlightedWord(
      onTap: () => print('paracetamol'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you need to eat': HighlightedWord(
      onTap: () => print('you need to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i am nervous': HighlightedWord(
      onTap: () => print('i am nervous'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i have to eat': HighlightedWord(
      onTap: () => print('i have to eat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'kill yourself': HighlightedWord(
      onTap: () => print('kill yourself'),
      textStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you are stronger than': HighlightedWord(
      onTap: () => print('you are stronger than'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'survived': HighlightedWord(
      onTap: () => print('survived'),
      textStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
    'i will miss you': HighlightedWord(
      onTap: () => print('i will miss you'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'feminist': HighlightedWord(
      onTap: () => print('feminist'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you are not fat': HighlightedWord(
      onTap: () => print('you are not fat'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
  };
}
