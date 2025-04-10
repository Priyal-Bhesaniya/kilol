import 'package:flutter/material.dart';
import 'package:kilol/screens/AksharLearnPage.dart';
import 'package:kilol/screens/AksharTestPage.dart';

class Shapespage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1), // Soft light background
      appBar: AppBar(
        title: Text(
          'આકૃતિઓ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange, // Strong orange for AppBar
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // You can uncomment and add any text if needed
            // Text(
            //   'આકૃતિઓ પેજમાં આપનું સ્વાગત છે!',
            //   style: TextStyle(
            //     fontSize: 26,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black, // Main text in black
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(height: 40),
            _buildOptionButton(
              context,
              icon: Icons.menu_book,
              label: 'અભ્યાસ કરો',
              color: Colors.orangeAccent.shade100, // Lighter orange for learning
              destination: AksharLearnPage(),
              textColor: Colors.black,
            ),
            SizedBox(height: 20),
            _buildOptionButton(
              context,
              icon: Icons.quiz,
              label: 'પરીક્ષા આપો',
              color: Colors.deepOrangeAccent, // Darker orange for test
              destination: AksharTestPage(),
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
