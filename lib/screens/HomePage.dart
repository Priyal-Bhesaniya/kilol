import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kilol/screens/AksharPage.dart';
import 'package:kilol/screens/AnimalsPage.dart';
import 'package:kilol/screens/EmotionsPage.dart';
import 'package:kilol/screens/MathPage.dart';
import 'package:kilol/screens/SanskarPage.dart';
import 'package:kilol/screens/ShapesPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1), // Light warm background
      appBar: AppBar(
        title: Text(
          'કિલોલ - રમત અને શિક્ષણ',
          style: GoogleFonts.balooBhai2(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // // Welcome text with emoji
            // Text(
            //   '🎉 સ્વાગત છે, બાળકો!',
            //   style: GoogleFonts.balooBhai2(
            //     fontSize: 32,
            //     fontWeight: FontWeight.w700,
            //     color: Colors.black,
            //   ),
            // ),
            const SizedBox(height: 10),

          
            const SizedBox(height: 20),

            // Grid Menu
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildCategoryTile(context, 'અક્ષરો', 'assets/images/k.png', Colors.blueAccent, AksharPage()),
_buildCategoryTile(context, 'ગણિત', 'assets/images/ek.png', Colors.redAccent, Mathpage()),
_buildCategoryTile(context, 'પ્રાણીઓ', 'assets/images/animals.jpg', Colors.green, Animalspage()),
_buildCategoryTile(context, 'આકૃતિઓ', 'assets/images/shapes.jpg', Colors.deepPurple, Shapespage()),
_buildCategoryTile(context, 'ભાવનાઓ', 'assets/images/imotions.webp', Colors.orange, Emotionspage()),
_buildCategoryTile(context, 'સંસ્કાર', 'assets/images/sanskar.png', Colors.teal, Sanskarpage()),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildCategoryTile(
    BuildContext context,
    String title,
    String imagePath,
    Color color,
    Widget destinationPage,
  ) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destinationPage),
      );
    },
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.balooBhai2(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    ),
  );
}

}
