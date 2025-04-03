import 'package:flutter/material.dart';
import 'package:kilol/screens/HomePage.dart';

import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Simple bounce animation for the text
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Navigate to next page after 6 seconds
    Future.delayed(Duration(seconds: 6), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>HomePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0), // Warm and soft background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation with a cute animated element
            Lottie.asset(
              'assets/animation/LoadingPage.json',
              height: 200,
            ),
            SizedBox(height: 20),
            
            // Animated bouncing text
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Text(
                    'કિલોલ', // Gujarati text
                    style: TextStyle(
                      fontSize: 30, // Bigger font size
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontFamily: 'ComicSansMS', // Playful font (ensure it's added in pubspec.yaml)
                    ),
                  ),
                );
              },
            ),
            
            SizedBox(height: 10),

           
          ],
        ),
      ),
    );
  }
}
