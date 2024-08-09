import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final speechProvider = ChangeNotifierProvider<SpeechNotifier>((ref) {
  return SpeechNotifier();
});

class SpeechNotifier extends ChangeNotifier {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _isListening = false;
  String _wordsSpoken = "";
  double _confidenceLevel = 0.0;

  bool get speechEnabled => _speechEnabled;
  bool get isListening => _isListening;
  String get wordsSpoken => _wordsSpoken;
  double get confidenceLevel => _confidenceLevel;

  SpeechNotifier() {
    initState();
  }

  void initState() {
    _initialize();
    notifyListeners();
  }

void _initialize() async {
  try {
    bool available = await _speechToText.initialize();
    if (available) {
      _speechEnabled = true;
    } else {
      print("Speech recognition is not available on this device.");
    }
  } catch (e) {
    print("Error initializing SpeechToText: $e");
  }
  notifyListeners();
}


void startListening() {
  if (_speechEnabled) {
    _isListening = true;
    _confidenceLevel = 0;
    notifyListeners();
    _speechToText.listen(onResult: _onSpeechResult);
  } else {
    print("SpeechToText is not initialized.");
  }
}


  void stopListening() async {
    await _speechToText.stop();
    _isListening = false;
    notifyListeners();
  }

  void _onSpeechResult(result) {
    _wordsSpoken = result.recognizedWords;
    _confidenceLevel = result.confidence;
    notifyListeners();
  }
}
