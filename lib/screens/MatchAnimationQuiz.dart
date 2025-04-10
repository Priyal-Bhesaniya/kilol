import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class MatchAnimationQuiz extends StatefulWidget {
  const MatchAnimationQuiz({super.key});

  @override
  State<MatchAnimationQuiz> createState() => _MatchAnimationQuizState();
}

class _MatchAnimationQuizState extends State<MatchAnimationQuiz> {
  final List<Map<String, String>> allAnimals = [
    {'name': 'સિંહ', 'lottie': 'assets/animation/Lion.json', 'sound': 'Lion.mp3'},
    {'name': 'હાથી', 'lottie': 'assets/animation/elephant.json', 'sound': 'Elephant.mp3'},
    {'name': 'ઘોડો', 'lottie': 'assets/animation/Horse.json', 'sound': 'Horse.mp3'},
    {'name': 'બિલાડી', 'lottie': 'assets/animation/cat.json', 'sound': 'Cat.mp3'},
    {'name': 'કૂતરો', 'lottie': 'assets/animation/dog.json', 'sound': 'Dog.mp3'},
    {'name': 'વાંદરો', 'lottie': 'assets/animation/monkeyFinal.json', 'sound': 'macaco-38923.mp3'},
    {'name': 'માછલી', 'lottie': 'assets/animation/fish.json', 'sound': 'Fish.mp3'},
    {'name': 'કાચબો', 'lottie': 'assets/animation/turtle.json', 'sound': 'Turtle.mp3'},
    {'name': 'તારામાછલી', 'lottie': 'assets/animation/star-fish.json', 'sound': 'star-fish.mp3'},
    {'name': 'દેડકો', 'lottie': 'assets/animation/frog.json', 'sound': 'Frog.mp3'},
    {'name': 'ચકલી', 'lottie': 'assets/animation/sparrow.json', 'sound': 'Sparrow1.mp3'},
    {'name': 'કબૂતર', 'lottie': 'assets/animation/pigeon.json', 'sound': 'Pigeon.mp3'},
    {'name': 'મોર', 'lottie': 'assets/animation/peacock.json', 'sound': 'Peacock.mp3'},
    {'name': 'પોપટ', 'lottie': 'assets/animation/parrot.json', 'sound': 'Parrot.mp3'},
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();
  late List<Map<String, String>> quizSet;
  Map<String, String?> matched = {};
  List<String> names = [];

  @override
  void initState() {
    super.initState();
    _loadNewQuiz();
  }

  void _loadNewQuiz() {
    quizSet = List<Map<String, String>>.from(allAnimals)..shuffle();
    quizSet = quizSet.take(4).toList(); // Take only 4 animations
    matched = {for (var item in quizSet) item['name']!: null};
    names = matched.keys.toList()..shuffle();

    setState(() {});
  }
void _checkMatch(String target, String dropped) async {
  if (target == dropped) {
    setState(() {
      matched[target] = dropped;
    });

    // Play good.mp3 for correct match
    await _audioPlayer.play(AssetSource('audio/good.mp3'));

    // Check if all matches are done
    if (matched.values.every((v) => v != null)) {
      await Future.delayed(const Duration(milliseconds: 700));
      _showResult("બધું સાચું! ", Colors.green);
      await Future.delayed(const Duration(seconds: 2));
      _loadNewQuiz();
    }
  } else {
    // Play bad.mp3 for incorrect match
    await _audioPlayer.play(AssetSource('audio/bad.mp3'));
    _showResult("ફરી પ્રયાસ કરો", Colors.red);
  }
}


  void _showResult(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'સાચો નામ ખેંચો અને યોગ્ય એનિમેશન પર મૂકો.',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                // Left: Lottie Targets
                Expanded(
                  child: ListView(
                    children: quizSet.map((animal) {
                      final name = animal['name']!;
                      final animationPath = animal['lottie']!;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DragTarget<String>(
                          onAccept: (dropped) => _checkMatch(name, dropped),
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.deepOrange, width: 2),
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.orange.shade50,
                              ),
                              child: Column(
                                children: [
                                  Lottie.asset(animationPath, height: 100),
                                  const SizedBox(height: 10),
                                  Text(
                                    matched[name] ?? '___',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const VerticalDivider(),

                // Right: Draggable Names
                Expanded(
                  child: ListView(
                    children: names.map((name) {
                      if (matched[name] != null) return const SizedBox();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Draggable<String>(
                          data: name,
                          feedback: Material(
                            color: Colors.transparent,
                            child: Chip(
                              label: Text(name,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                          childWhenDragging: const SizedBox(),
                          child: Chip(
                            label: Text(name, style: const TextStyle(fontSize: 18)),
                            backgroundColor: Colors.deepOrange.shade100,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
