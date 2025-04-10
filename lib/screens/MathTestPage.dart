import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

class Mathtestpage extends StatefulWidget {
  const Mathtestpage({super.key});

  @override
  State<Mathtestpage> createState() => _MathtestpageState();
}

class _MathtestpageState extends State<Mathtestpage> {
  final List<Map<String, String>> numbers = [
    {'digit': '૧', 'gujarati': 'એક'},
    {'digit': '૨', 'gujarati': 'બે'},
    {'digit': '૩', 'gujarati': 'ત્રણ'},
    {'digit': '૪', 'gujarati': 'ચાર'},
    {'digit': '૫', 'gujarati': 'પાંચ'},
    {'digit': '૬', 'gujarati': 'છ'},
    {'digit': '૭', 'gujarati': 'સાત'},
    {'digit': '૮', 'gujarati': 'આઠ'},
    {'digit': '૯', 'gujarati': 'નવ'},
    {'digit': '૧૦', 'gujarati': 'દસ'},
    {'digit': '૧૧', 'gujarati': 'અગિયાર'},
    {'digit': '૧૨', 'gujarati': 'બાર'},
    {'digit': '૧૩', 'gujarati': 'તેર'},
    {'digit': '૧૪', 'gujarati': 'ચૌદ'},
    {'digit': '૧૫', 'gujarati': 'પંદર'},
    {'digit': '૧૬', 'gujarati': 'સોળ'},
    {'digit': '૧૭', 'gujarati': 'સત્તર'},
    {'digit': '૧૮', 'gujarati': 'અઢાર'},
    {'digit': '૧૯', 'gujarati': 'ઓગણીસ'},
    {'digit': '૨૦', 'gujarati': 'વિસ'},
  ];

  final AudioPlayer player = AudioPlayer();
  String feedback = '';
  late Map<String, String> currentItem;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _loadNewQuestion();
  }

  @override
  void dispose() {
    // Dispose the audio player when it's no longer needed.
    player.dispose();
    super.dispose();
  }

  void _loadNewQuestion() {
    setState(() {
      currentItem = numbers[random.nextInt(numbers.length)];
      feedback = '';
    });
  }

  void _showFeedback(bool isCorrect) {
    setState(() {
      feedback = isCorrect ? 'સારો કામ! 🎉' : 'ફરી પ્રયાસ કરો 🙈';
    });

    // Play the appropriate sound based on the feedback
    _playSound(isCorrect ? 'good.mp3' : 'bad.mp3');

    Future.delayed(const Duration(seconds: 1), _loadNewQuestion);
  }

 Future<void> _playSound(String soundFile) async {
  try {
    // Print the sound file for debugging
    print('Playing sound: assets/audio/$soundFile');

    // Play the audio from the asset
    await player.play(AssetSource('audio/$soundFile'));

    // Optional: print a message once playback starts
    print('Sound is playing');

  } catch (e) {
    // Print the error if any occurs while playing the sound
    print('Audio error: $e');
  }
}



  Widget _quizMatchGujarati() {
    List<Map<String, String>> options = [currentItem];
    while (options.length < 4) {
      Map<String, String> randomOption = numbers[random.nextInt(numbers.length)];
      if (!options.contains(randomOption)) {
        options.add(randomOption);
      }
    }
    options.shuffle();

    return Column(
      children: [
        const Text('આ નંબર શું કહેવાય છે?', style: TextStyle(fontSize: 24)),
        Text(currentItem['digit']!, style: const TextStyle(fontSize: 60, color: Colors.blue)),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          children: options.map((item) {
            return ElevatedButton(
              onPressed: () => _showFeedback(item['gujarati'] == currentItem['gujarati']),
              child: Text(item['gujarati']!, style: const TextStyle(fontSize: 20)),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _quizFillInTheBlank() {
    int index = numbers.indexOf(currentItem);
    if (index < 1 || index >= numbers.length - 1) {
      currentItem = numbers[2]; // fallback
      index = 2;
    }

    String prev = numbers[index - 1]['digit']!;
    String next = numbers[index + 1]['digit']!;
    String correct = currentItem['digit']!;
    List<String> choices = [correct];

    while (choices.length < 4) {
      String randomDigit = numbers[random.nextInt(numbers.length)]['digit']!;
      if (!choices.contains(randomDigit)) choices.add(randomDigit);
    }
    choices.shuffle();

    return Column(
      children: [
        const Text('ખાલી જગ્યા ભરો:', style: TextStyle(fontSize: 24)),
        Text('$prev  __  $next', style: const TextStyle(fontSize: 40, color: Colors.teal)),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          children: choices.map((choice) {
            return ElevatedButton(
              onPressed: () => _showFeedback(choice == correct),
              child: Text(choice, style: const TextStyle(fontSize: 26)),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _quizListenAndChoose() {
    List<Map<String, String>> options = [currentItem];
    while (options.length < 4) {
      Map<String, String> randomOption = numbers[random.nextInt(numbers.length)];
      if (!options.contains(randomOption)) {
        options.add(randomOption);
      }
    }
    options.shuffle();

    return Column(
      children: [
        const Text('ધ્વનિ સાંભળો અને યોગ્ય નંબર પસંદ કરો', style: TextStyle(fontSize: 24)),
        IconButton(
          icon: const Icon(Icons.volume_up, size: 36),
          onPressed: () => _playSound('${currentItem['digit']}.mp3'),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          children: options.map((item) {
            return ElevatedButton(
              onPressed: () => _showFeedback(item['digit'] == currentItem['digit']),
              child: Text(item['digit']!, style: const TextStyle(fontSize: 26)),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'પરીક્ષા',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'મેચ કરો'),
              Tab(text: 'સાચું પસંદ કરો'),
              Tab(text: 'અવાજ ઓળખો'),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFFFF3E0),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    _quizMatchGujarati(),
                    _quizFillInTheBlank(),
                    _quizListenAndChoose(),
                  ],
                ),
              ),
              if (feedback.isNotEmpty)
                Text(
                  feedback,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: feedback.contains('સારો') ? Colors.green : Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
