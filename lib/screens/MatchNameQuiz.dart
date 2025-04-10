import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart'; // Import the package

class MatchNameQuiz extends StatefulWidget {
  const MatchNameQuiz({super.key});

  @override
  State<MatchNameQuiz> createState() => _MatchNameQuizState();
}

class _MatchNameQuizState extends State<MatchNameQuiz> {
  final List<Map<String, String>> animals = [
    {'name': 'સિંહ', 'lottie': 'assets/animation/Lion.json'},
    {'name': 'હાથી', 'lottie': 'assets/animation/elephant.json'},
    {'name': 'ઘોડો', 'lottie': 'assets/animation/Horse.json'},
    {'name': 'બિલાડી', 'lottie': 'assets/animation/cat.json'},
    {'name': 'કૂતરો', 'lottie': 'assets/animation/dog.json'},
    {'name': 'વાંદરો', 'lottie': 'assets/animation/monkeyFinal.json'},
    {'name': 'માછલી', 'lottie': 'assets/animation/fish.json'},
    {'name': 'કાચબો', 'lottie': 'assets/animation/turtle.json'},
    {'name': 'તારામાછલી', 'lottie': 'assets/animation/star-fish.json'},
    {'name': 'દેડકો', 'lottie': 'assets/animation/frog.json'},
    {'name': 'ચકલી', 'lottie': 'assets/animation/sparrow.json'},
    {'name': 'કબૂતર', 'lottie': 'assets/animation/pigeon.json'},
    {'name': 'મોર', 'lottie': 'assets/animation/peacock.json'},
    {'name': 'પોપટ', 'lottie': 'assets/animation/parrot.json'},
  ];

  int currentIndex = 0;
  bool? isCorrect;
  bool showLarge = false;
  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio player instance

  void checkAnswer(String selectedName) async {
    final correctName = animals[currentIndex]['name'];

    setState(() {
      isCorrect = selectedName == correctName;
      showLarge = isCorrect == true;
    });

    // Play good.mp3 if correct, bad.mp3 if incorrect
    if (isCorrect == true) {
      await _audioPlayer.play(AssetSource('audio/good.mp3')); // Play good.mp3
    } else {
      await _audioPlayer.play(AssetSource('audio/bad.mp3')); // Play bad.mp3
    }

    // Move to next question after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        currentIndex = (currentIndex + 1) % animals.length;
        isCorrect = null;
        showLarge = false;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Clean up the audio player when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = animals[currentIndex];
    final List<Map<String, String>> options = List.from(animals)..shuffle();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('${current['name']} ને ઓળખો:',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          if (showLarge)
            Expanded(
              child: Center(
                child: Lottie.asset(current['lottie']!, height: 250),
              ),
            )
          else
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
                      child: Lottie.asset(animal['lottie']!, fit: BoxFit.contain),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
