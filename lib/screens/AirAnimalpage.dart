import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kilol/main.dart'; // For AppLanguage

class AirAnimalsPage extends StatelessWidget {
  // Animal data with translations and sounds
  final List<Map<String, Map<String, String>>> airAnimals = [
    {
      'name': {'en': 'Sparrow', 'hi': 'चकली', 'gu': 'ચકલી'},
      'lottie': {'en': 'assets/animation/sparrow.json'},
      'sound': {'en': 'Sparrow1.mp3'},
    },
    {
      'name': {'en': 'Pigeon', 'hi': 'कबूतर', 'gu': 'કબૂતર'},
      'lottie': {'en': 'assets/animation/pigeon.json'},
      'sound': {'en': 'Pigeon.mp3'},
    },
    {
      'name': {'en': 'Peacock', 'hi': 'मोर', 'gu': 'મોર'},
      'lottie': {'en': 'assets/animation/peacock.json'},
      'sound': {'en': 'Peacock.mp3'},
    },
    {
      'name': {'en': 'Parrot', 'hi': 'तोता', 'gu': 'પોપટ'},
      'lottie': {'en': 'assets/animation/parrot.json'},
      'sound': {'en': 'Parrot.mp3'},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        title: const Text(
          'આકાશમાં ઉડતાં પક્ષીઓ', // Keep static title
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 5,
        actions: [
          // Language Dropdown on the right
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DropdownButton<String>(
              value: AppLanguage.lang.value,
              dropdownColor: Colors.blueAccent,
              icon: const Icon(Icons.language, color: Colors.white),
              underline: const SizedBox(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              items: const [
                DropdownMenuItem(value: "en", child: Text("English")),
                DropdownMenuItem(value: "hi", child: Text("हिंदी")),
                DropdownMenuItem(value: "gu", child: Text("ગુજરાતી")),
              ],
              onChanged: (value) {
                if (value != null) {
                  AppLanguage.lang.value = value; // Updates animal names dynamically
                }
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: airAnimals.length,
        itemBuilder: (context, index) {
          final animal = airAnimals[index];
          return Card(
            color: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Lottie.asset(
                    animal['lottie']!['en']!,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    animal['name']![AppLanguage.lang.value]!, // Dynamic name
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Voice button
                  ElevatedButton.icon(
                    onPressed: () async {
                      final player = AudioPlayer();
                      await player.play(
                        AssetSource('audio/${animal['sound']!['en']}'),
                      );
                    },
                    icon: const Icon(Icons.volume_up, color: Colors.white),
                    label: const Text('Play', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
