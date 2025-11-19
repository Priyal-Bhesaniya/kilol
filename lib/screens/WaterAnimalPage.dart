import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:kilol/main.dart'; // For AppLanguage

class WaterAnimalsPage extends StatelessWidget {
  // Animal data with translations
  final List<Map<String, Map<String, String>>> waterAnimals = [
    {
      'name': {'en': 'Fish', 'hi': 'मछली', 'gu': 'માછલી'},
      'lottie': {'en': 'assets/animation/fish.json'},
    },
    {
      'name': {'en': 'Turtle', 'hi': 'कछुआ', 'gu': 'કાચબો'},
      'lottie': {'en': 'assets/animation/turtle.json'},
    },
    {
      'name': {'en': 'Starfish', 'hi': 'स्टारफिश', 'gu': 'તારામાછલી'},
      'lottie': {'en': 'assets/animation/star-fish.json'},
    },
    {
      'name': {'en': 'Frog', 'hi': 'मेंढक', 'gu': 'દેડકો'},
      'lottie': {'en': 'assets/animation/frog.json'},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        title: const Text(
          'પાણીમાં રહેતાં જીવો', // Keep static title
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 5,
        actions: [
          // Language Dropdown on the right
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DropdownButton<String>(
              value: AppLanguage.lang.value,
              dropdownColor: Colors.teal,
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
        itemCount: waterAnimals.length,
        itemBuilder: (context, index) {
          final animal = waterAnimals[index];
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
                      color: Colors.teal,
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
