import 'package:flutter/material.dart';
import 'package:kilol/screens/MathLearnPage.dart'; // Replace with actual page
import 'package:kilol/screens/MathTestPage.dart';  // Replace with actual page

class Mathpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1), // Light blue background
      appBar: AppBar(
        title: Text('ગણિત',
        style: TextStyle(
          color: Colors.white
        ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Optional welcome text
            // Text(
            //   'ગણિત પેજમાં આપનું સ્વાગત છે!',
            //   style: TextStyle(
            //     fontSize: 26,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(height: 40),
            _buildOptionButton(
              context,
              icon: Icons.menu_book,
              label: 'અભ્યાસ કરો',
              color: Colors.orangeAccent.shade100,
              destination:Mathlearnpage(), // Your learning page widget
              textColor: Colors.black,
            ),
            SizedBox(height: 20),
            _buildOptionButton(
              context,
              icon: Icons.quiz,
              label: 'પરીક્ષા આપો',
              color: Colors.deepOrange,
              destination: Mathtestpage(), // Your test page widget
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required Widget destination,
    required Color textColor,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: Size(double.infinity, 60),
        elevation: 5,
        foregroundColor: textColor,
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
      },
      icon: Icon(icon, size: 28),
      label: Text(
        label,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
