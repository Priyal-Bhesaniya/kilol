import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class AirAnimalsPage extends StatelessWidget {
  final List<Map<String, String>> airAnimals = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        title: const Text(
          'આકાશમાં ઉડતાં પક્ષીઓ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 5,
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
                      color: Colors.blueAccent,
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
                    label: const Text(''),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
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
