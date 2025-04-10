import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class WaterAnimalsPage extends StatelessWidget {
  final List<Map<String, String>> waterAnimals = [
    {
      'name': 'માછલી',
      'lottie': 'assets/animation/fish.json',
      'sound': 'Fish.mp3',
    },
    {
      'name': 'કાચબો',
      'lottie': 'assets/animation/turtle.json',
      'sound': 'Turtle.mp3',
    },
    {
      'name': 'તારામાછલી',
      'lottie': 'assets/animation/star-fish.json',
      'sound': 'star-fish.mp3',
    },
    {
      'name': 'દેડકો',
      'lottie': 'assets/animation/frog.json',
      'sound': 'Frog.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        title: const Text(
          'પાણીમાં રહેતાં જીવો',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 5,
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
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // ElevatedButton.icon(
                  //   onPressed: () async {
                  //     final player = AudioPlayer();
                  //     await player.play(
                  //       AssetSource('audio/${animal['sound']}'),
                  //     );
                  //   },
                  //   icon: const Icon(Icons.volume_up),
                  //   label: const Text(''),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.teal,
                  //     foregroundColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 24,
                  //       vertical: 12,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
