import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FruitsPage extends StatelessWidget {
  final List<Map<String, String>> fruits = [
     {
      'name': 'સફરજન',
      'lottie': 'assets/animation/fruit3.json',
    },
    {
      'name': 'કેળું',
      'lottie': 'assets/animation/banana.json',
    },
   
    {
      'name': 'તરબૂચ',
      'lottie': 'assets/animation/watermelon.json',
    },
    {
      'name': 'કેરી',
      'lottie': 'assets/animation/fruit4.json',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text(
          'ફળો',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          final isLottie = fruit['lottie']!.endsWith('.json');

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
                  isLottie
                      ? Lottie.asset(
                          fruit['lottie']!,
                          height: 200,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          fruit['lottie']!,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                  const SizedBox(height: 12),
                  Text(
                    fruit['name']!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.deepOrangeAccent,
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
