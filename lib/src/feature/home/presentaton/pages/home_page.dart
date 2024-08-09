import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_writer/src/core/style/colors.dart';
import 'package:text_writer/src/feature/home/view_model/home_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speechNotifier = ref.watch(speechProvider);
    return Scaffold(
      backgroundColor: const Color(0xFF021526),
      appBar: AppBar(
        backgroundColor: const Color(0xFF021526),
        title: const Text(
          "Convert Voice to Text",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              speechNotifier.isListening
                  ? "listening..."
                  : speechNotifier.speechEnabled
                      ? "Tap the microphone to start listening..."
                      : "Speech not available",
              style: const TextStyle(
                fontSize: 20.0,
                color: AppColors.white,
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                speechNotifier.wordsSpoken,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          if (!speechNotifier.isListening && speechNotifier.confidenceLevel > 0)
            Padding(
              padding: const EdgeInsets.only(
                bottom: 100,
              ),
              child: Text(
                "Confidence: ${(speechNotifier.confidenceLevel * 100).toStringAsFixed(1)}%",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w200,
                ),
              ),
            )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF021526),
        onPressed: speechNotifier.isListening
            ? speechNotifier.stopListening
            : speechNotifier.startListening,
        tooltip: 'Listen',
        child: Icon(
          size: 60,
          color: AppColors.white,
          speechNotifier.isListening ? Icons.mic_off : Icons.mic,
        ),
      ),
    );
  }
}
