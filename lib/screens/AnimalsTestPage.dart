import 'package:flutter/material.dart';
import 'package:kilol/screens/MatchAnimationQuiz.dart';
import 'package:kilol/screens/MatchNameQuiz.dart';
import 'package:kilol/screens/WhoAmIQuiz.dart';

class Animalstestpage extends StatefulWidget {
  const Animalstestpage({super.key});

  @override
  State<Animalstestpage> createState() => _AnimalstestpageState();
}

class _AnimalstestpageState extends State<Animalstestpage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       appBar: AppBar(
  title: const Text(
    'પરીક્ષા',
    style: TextStyle(color: Colors.white), // Title text color
  ),
  centerTitle: true,
  backgroundColor: Colors.deepOrange,
  bottom: const TabBar(
    labelColor: Colors.white,          // Selected tab text color
    unselectedLabelColor: Colors.white70, // Unselected tab text
    indicatorColor: Colors.white,      // Tab underline color
    tabs: [
      Tab(text: 'મેચ કરો'),
      Tab(text: 'સાચું પસંદ કરો'),
      Tab(text: 'અવાજ ઓળખો'),
    ],
  ),
),

        body: const TabBarView(
          children: [
            MatchAnimationQuiz(),
            MatchNameQuiz(),
           WhoAmIQuiz(),
          ],
        ),
      ),
    );
  }
}
