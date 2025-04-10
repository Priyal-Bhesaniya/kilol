import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class LandAnimalsPage extends StatelessWidget {
  final List<Map<String, String>> landAnimals = [
    {
      'name': 'સિંહ',
      'lottie': 'assets/animation/Lion.json',
      'sound': 'Lion.mp3',
    },
    {
      'name': 'હાથી',
      'lottie': 'assets/animation/elephant.json',
      'sound': 'Elephant.mp3',
    },
    {
      'name': 'ઘોડો',
      'lottie': 'assets/animation/Horse.json',
      'sound': 'Horse.mp3',
    },
    {
      'name': 'બિલાડી',
      'lottie': 'assets/animation/cat.json',
      'sound': 'Cat.mp3',
    },
    {
      'name': 'કૂતરો',
      'lottie': 'assets/animation/dog.json',
      'sound': 'Dog.mp3',
    },
    {
      'name': 'વાંદરો',
      'lottie': 'assets/animation/monkeyFinal.json',
      'sound': 'macaco-38923.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text(
          'જમીન પર રહેતાં પ્રાણીઓ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 5,
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
                    animal['lottie']!,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    animal['name']!,
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
                        AssetSource('audio/${animal['sound']}'),
                      );
                    },
                    icon: const Icon(Icons.volume_up),
                    label: const Text(
                      '',
                      style: TextStyle(fontSize: 18),
                    ),
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
