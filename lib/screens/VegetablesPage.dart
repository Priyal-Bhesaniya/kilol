import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VegetablesPage extends StatelessWidget {
  final List<Map<String, String>> vegetables = [
    {
      'name': 'ટમેટું',
      'lottie': 'assets/animation/tomato.json',
    },
    {
      'name': 'બટાકું',
      'lottie': 'assets/images/potato.jpg',
    },
    {
      'name': 'ગાજર',
      'lottie': 'assets/animation/vegi1.json',
    },
    {
      'name': 'રીંગણ',
      'lottie': 'assets/animation/bringle.json',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        title: const Text(
          'શાકભાજી',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: vegetables.length,
        itemBuilder: (context, index) {
          final veg = vegetables[index];
          final isLottie = veg['lottie']!.endsWith('.json');

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
                          veg['lottie']!,
                          height: 200,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          veg['lottie']!,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                  const SizedBox(height: 12),
                  Text(
                    veg['name']!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.lightGreen,
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
