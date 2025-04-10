import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';

class WhoAmIQuiz extends StatefulWidget {
  const WhoAmIQuiz({super.key});

  @override
  State<WhoAmIQuiz> createState() => _WhoAmIQuizState();
}

class _WhoAmIQuizState extends State<WhoAmIQuiz> {
  final List<Map<String, String>> animals = [
    {
      'name': 'કૂતરો',
      'lottie': 'assets/animation/dog.json',
      'sound': 'dog-bark-sfx-322245.mp3',
    },
    {
      'name': 'બિલાડી',
      'lottie': 'assets/animation/cat.json',
      'sound': 'Cat.mp3',
    },
    {
      'name': 'હાથી',
      'lottie': 'assets/animation/elephant.json',
      'sound': 'Elephant.mp3',
    },
    {
      'name': 'ચકલી',
      'lottie': 'assets/animation/sparrow.json',
      'sound': 'Sparrow1.mp3',
    },
    {
      'name': 'કબૂતર',
      'lottie': 'assets/animation/pigeon.json',
      'sound': 'Pigeon.mp3',
    },
    {
      'name': 'મોર',
      'lottie': 'assets/animation/peacock.json',
      'sound': 'Peacock.mp3',
    },
    {
      'name': 'પોપટ',
      'lottie': 'assets/animation/parrot.json',
      'sound': 'Parrot.mp3',
    },
  ];

  int currentIndex = 0;
  final AudioPlayer _player = AudioPlayer();
  bool? isCorrect;
  String? selectedAnswer;
  bool showFullScreenAnimation = false;

  void playSound() async {
    final sound = animals[currentIndex]['sound'];
    await _player.play(AssetSource('audio/$sound'));
  }

  void checkAnswer(String selected) async {
    final correct = selected == animals[currentIndex]['name'];
    setState(() {
      isCorrect = correct;
      selectedAnswer = selected;
    });

    // Play appropriate sound based on the correctness of the answer
    if (correct) {
      await _player.play(AssetSource('audio/good.mp3')); // Play good.mp3 for correct answer
    } else {
      await _player.play(AssetSource('audio/bad.mp3')); // Play bad.mp3 for incorrect answer
    }

    // Show the correct animation after answering
    if (correct) {
      setState(() => showFullScreenAnimation = true);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          showFullScreenAnimation = false;
          currentIndex = (currentIndex + 1) % animals.length;
          isCorrect = null;
          selectedAnswer = null;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = animals[currentIndex];
    final options = List<Map<String, String>>.from(animals)..shuffle();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text('આ અવાજ કોનો છે?', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: playSound,
                icon: const Icon(Icons.volume_up),
                label: const Text('અવાજ વગાડો'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: options.map((animal) {
                    return GestureDetector(
                      onTap: () => checkAnswer(animal['name']!),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: isCorrect == null
                              ? BorderSide.none
                              : (animal['name'] == current['name']
                                  ? const BorderSide(color: Colors.green, width: 3)
                                  : const BorderSide(color: Colors.red, width: 3)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(animal['lottie']!, height: 100),
                            const SizedBox(height: 10),
                            Text(animal['name']!, style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),

        // ✅ Full-screen animation overlay
        if (showFullScreenAnimation)
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Lottie.asset(
                  current['lottie']!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
