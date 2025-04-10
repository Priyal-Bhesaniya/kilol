import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class EmotionsPage extends StatefulWidget {
  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {
  final AudioPlayer player = AudioPlayer();

  final List<Map<String, dynamic>> emotions = [
    {'animation': 'assets/animation/happy.json', 'audio': 'happy.mp3'},
    {'animation': 'assets/animation/sadd.json', 'audio': 'sad.mp3'},
    {'animation': 'assets/animation/angry.json', 'audio': 'angry.mp3'},
    {'animation': 'assets/animation/sleepy.json', 'audio': 'sleepy.mp3'},
  ];

  late int correctIndex;
  late List<Map<String, dynamic>> options;
  String feedback = '';

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
      emotions.shuffle();
      correctIndex = Random().nextInt(emotions.length);
      options = List<Map<String, dynamic>>.from(emotions);
      options.shuffle();
      feedback = '';
    });
  }

  void _checkAnswer(String selected) {
    final correct = emotions[correctIndex]['animation'];
    setState(() {
      if (selected == correct) {
        _playSound('good.mp3');  // Play correct sound
        Future.delayed(Duration(seconds: 2), () {
          _loadNewQuestion();
        });
      } else {
        _playSound('bad.mp3');  // Play incorrect sound
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final targetEmotion = emotions[correctIndex];

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: Text("મેચ કરો", style: TextStyle(color : Colors.white)),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "આ ભાવના સાથે મેળ ખાતું એનિમેશન પસંદ કરો!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Lottie.asset(
              targetEmotion['animation'],
              height: 180,
              repeat: true,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: options.map((option) {
                  return GestureDetector(
                    onTap: () => _checkAnswer(option['animation']),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.pinkAccent, width: 2),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Lottie.asset(option['animation']),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (feedback.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  feedback,
                  style: TextStyle(
                      fontSize: 24,
                      color: feedback == 'correct' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
