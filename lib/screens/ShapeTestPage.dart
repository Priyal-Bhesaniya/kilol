import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class Shapetestpage extends StatefulWidget {
  const Shapetestpage({super.key});

  @override
  State<Shapetestpage> createState() => _ShapetestpageState();
}

class _ShapetestpageState extends State<Shapetestpage> {
  final AudioPlayer player = AudioPlayer();
  final Random random = Random();

  final List<Map<String, String>> shapes = [
    {
      'name': 'ગોળ',
      'animation': 'assets/animation/circle.json',
      'audio': 'circle.mp3',
    },
    {
      'name': 'ચોરસ',
      'animation': 'assets/animation/suqare.json',
      'audio': 'square.mp3',
    },
    {
      'name': 'ત્રિકોણ',
      'animation': 'assets/animation/triangle.json',
      'audio': 'triangle.mp3',
    },
    {
      'name': 'લંબચોરસ',
      'animation': 'assets/animation/rectangle.json',
      'audio': 'rectangle.mp3',
    },
  ];

  late Map<String, String> currentQuestion;
  late List<Map<String, String>> options;
  String feedback = '';
  Color feedbackColor = Colors.transparent;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    _loadNewQuestion();
  }

  void _playSound(String fileName) {
    player.stop();
    player.play(AssetSource('audio/$fileName'));
  }

  void _loadNewQuestion() {
    setState(() {
      currentQuestion = shapes[random.nextInt(shapes.length)];

      // Shuffle options and ensure the correct answer is included
      options = List<Map<String, String>>.from(shapes)..shuffle();
      if (!options.contains(currentQuestion)) {
        options[random.nextInt(4)] = currentQuestion;
      }

      feedback = '';
      feedbackColor = Colors.transparent;
      isCorrect = false;
    });
  }

  void _handleAnswer(Map<String, String> selectedOption) {
    bool correct = selectedOption['name'] == currentQuestion['name'];
    _playSound(correct ? 'good.mp3' : 'bad.mp3');

    setState(() {
      isCorrect = correct;
      feedback = correct ? '🎉 ખુબ જ સારું!' : 'ફરી પ્રયાસ કરો!';
      feedbackColor = correct ? Colors.green.shade200 : Colors.red.shade200;
    });

    // Show feedback animation
    Future.delayed(const Duration(seconds: 1), () {
      // After feedback, load the next question after a short delay
      Future.delayed(const Duration(seconds: 2), _loadNewQuestion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text('આકાર પરીક્ષણ', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: feedbackColor,
            child: Center(
              child: Text(
                feedback,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${currentQuestion['name']} ઓળખો',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: options.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final option = options[index];
                return GestureDetector(
                  onTap: () => _handleAnswer(option),
                  child: Card(
                    color: Colors.orange.shade100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(option['animation']!, height: 100),
                        const SizedBox(height: 10),
                        Text(
                          option['name']!,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
