import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kilol/main.dart'; // For AppLanguage

class LandAnimalsPage extends StatelessWidget {
  // Animal data with translations
  final List<Map<String, Map<String, String>>> landAnimals = [
    {
      'name': {'en': 'Lion', 'hi': 'सिंह', 'gu': 'સિંહ'},
      'lottie': {'en': 'assets/animation/Lion.json'},
      'sound': {'en': 'Lion.mp3'},
    },
    {
      'name': {'en': 'Elephant', 'hi': 'हाथी', 'gu': 'હાથી'},
      'lottie': {'en': 'assets/animation/elephant.json'},
      'sound': {'en': 'Elephant.mp3'},
    },
    {
      'name': {'en': 'Horse', 'hi': 'घोड़ा', 'gu': 'ઘોડો'},
      'lottie': {'en': 'assets/animation/Horse.json'},
      'sound': {'en': 'Horse.mp3'},
    },
    {
      'name': {'en': 'Cat', 'hi': 'बिल्ली', 'gu': 'બિલાડી'},
      'lottie': {'en': 'assets/animation/cat.json'},
      'sound': {'en': 'Cat.mp3'},
    },
    {
      'name': {'en': 'Dog', 'hi': 'कुत्ता', 'gu': 'કૂતરો'},
      'lottie': {'en': 'assets/animation/dog.json'},
      'sound': {'en': 'dog-bark-sfx-322245.mp3'},
    },
    {
      'name': {'en': 'Monkey', 'hi': 'बंदर', 'gu': 'વાંદરો'},
      'lottie': {'en': 'assets/animation/monkeyFinal.json'},
      'sound': {'en': 'macaco-38923.mp3'},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text(
          'જમીન પર રહેતાં પ્રાણીઓ', // Keep static in Gujarati
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 5,
        actions: [
          // Language Dropdown on the right
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DropdownButton<String>(
              value: AppLanguage.lang.value,
              dropdownColor: Colors.deepOrangeAccent,
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
                  AppLanguage.lang.value = value; // Updates names dynamically
                }
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: landAnimals.length,
        itemBuilder: (context, index) {
          final animal = landAnimals[index];
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
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final player = AudioPlayer();
                      await player.play(
                        AssetSource('audio/${animal['sound']!['en']}'),
                      );
                    },
                    icon: const Icon(Icons.volume_up),
                    label: const Text(''),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
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
