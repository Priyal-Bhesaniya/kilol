import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kilol/main.dart'; // AppLanguage

class ShapeLearnPage extends StatefulWidget {
  const ShapeLearnPage({super.key});

  @override
  State<ShapeLearnPage> createState() => _ShapeLearnPageState();
}

class _ShapeLearnPageState extends State<ShapeLearnPage> {
  final AudioPlayer player = AudioPlayer();

  final List<Map<String, dynamic>> shapes = [
    {
      'name': {'en': 'Circle', 'hi': 'वृत्त', 'gu': 'ગોળ'},
      'animation': 'assets/animation/circle.json',
      'audio': 'circle.mp3',
    },
    {
      'name': {'en': 'Square', 'hi': 'वर्ग', 'gu': 'ચોરસ'},
      'animation': 'assets/animation/suqare.json',
      'audio': 'square.mp3',
    },
    {
      'name': {'en': 'Triangle', 'hi': 'त्रिभुज', 'gu': 'ત્રિકોણ'},
      'animation': 'assets/animation/triangle.json',
      'audio': 'triangle.mp3',
    },
    {
      'name': {'en': 'Rectangle', 'hi': 'आयत', 'gu': 'લંબચોરસ'},
      'animation': 'assets/animation/rectangle.json',
      'audio': 'rectangle.mp3',
    },
  ];

  void _playSound(String fileName) {
    player.stop();
    player.play(AssetSource('audio/$fileName'));
  }

  void _openFullScreen(String animationPath, String audioFile, String shapeName) {
    _playSound(audioFile);
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(animationPath, height: 300),
              const SizedBox(height: 12),
              Text(
                shapeName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text('આકારો શીખો', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DropdownButton<String>(
              value: AppLanguage.lang.value,
              dropdownColor: Colors.deepOrange,
              icon: const Icon(Icons.language, color: Colors.white),
              underline: const SizedBox(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'hi', child: Text('हिंदी')),
                DropdownMenuItem(value: 'gu', child: Text('ગુજરાતી')),
              ],
              onChanged: (value) {
                if (value != null) {
                  AppLanguage.lang.value = value;
                }
              },
            ),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: AppLanguage.lang,
        builder: (context, String lang, _) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: shapes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final item = shapes[index];
              return GestureDetector(
                onTap: () => _openFullScreen(
                    item['animation'], item['audio'], item['name'][lang]!),
                child: Card(
                  color: Colors.orange.shade100,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(item['animation'], height: 100),
                      const SizedBox(height: 10),
                      Text(
                        item['name'][lang]!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
