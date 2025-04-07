import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmotionsPage extends StatefulWidget {
  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> with TickerProviderStateMixin {
  final List<Map<String, dynamic>> emotions = [
    {
      'animation': 'assets/animation/happy.json',
      'color': Colors.yellow.shade200,
    },
    {
      'animation': 'assets/animation/sadd.json',
      'color': Colors.blue.shade100,
    },
    {
      'animation': 'assets/animation/angry.json',
      'color': Colors.red.shade100,
    },
    {
      'animation': 'assets/animation/sleepy.json',
      'color': Colors.purple.shade100,
    },
  ];

  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      emotions.length,
      (_) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        lowerBound: 0.9,
        upperBound: 1.1,
      ),
    );
  }

  void _handleTap(int index) {
    _controllers[index].forward().then((_) {
      _controllers[index].reverse();
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: Text('Feelings'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: emotions.length,
        itemBuilder: (context, index) {
          final emotion = emotions[index];

          return GestureDetector(
            onTap: () => _handleTap(index),
            child: ScaleTransition(
              scale: _controllers[index],
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: emotion['color'],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: emotion['color'].withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Lottie.asset(
                    emotion['animation'],
                    height: 150,
                    repeat: true,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
