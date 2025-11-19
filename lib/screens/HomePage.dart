import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kilol/main.dart';
import 'package:kilol/screens/AksharPage.dart';
import 'package:kilol/screens/AnimalsPage.dart';
import 'package:kilol/screens/EmotionsPage.dart';
import 'package:kilol/screens/FruitsPage.dart';
import 'package:kilol/screens/MathPage.dart';
import 'package:kilol/screens/SanskarPage.dart';
import 'package:kilol/screens/ShapesPage.dart';
import 'package:kilol/screens/VegetablesPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),

      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // App Name on the left
            Text(
              t(context, "app_title"),
              style: GoogleFonts.balooBhai2(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            // Language Dropdown on the right
            ValueListenableBuilder(
              valueListenable: AppLanguage.lang,
              builder: (context, value, child) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<String>(
                    value: value,
                    underline: SizedBox(),
                    icon: Icon(Icons.language, color: Colors.white),
                    dropdownColor: Colors.deepOrangeAccent,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    items: const [
                      DropdownMenuItem(value: "gu", child: Text("ગુજરાતી")),
                      DropdownMenuItem(value: "hi", child: Text("हिंदी")),
                      DropdownMenuItem(value: "en", child: Text("English")),
                    ],
                    onChanged: (val) {
                      AppLanguage.lang.value = val!;
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            _tile(context, t(context, "letters"), "assets/images/k.png", Colors.blueAccent, AksharPage()),
            _tile(context, t(context, "math"), "assets/images/ek.png", Colors.redAccent, Mathpage()),
            _tile(context, t(context, "animals"), "assets/images/animals.jpg", Colors.green, AnimalsPage()),
            _tile(context, t(context, "shapes"), "assets/images/shapes.jpg", Colors.deepPurple, Shapespage()),
            _tile(context, t(context, "vegetables"), "assets/images/vegetables.jpg", Colors.lightGreen, VegetablesPage()),
            _tile(context, t(context, "fruits"), "assets/images/fruits.jpg", Colors.pinkAccent, FruitsPage()),
            _tile(context, t(context, "emotions"), "assets/images/imotions.webp", Colors.orange, EmotionsPage()),
            _tile(context, t(context, "culture"), "assets/images/sanskar.png", Colors.teal, Sanskarpage()),
          ],
        ),
      ),
    );
  }

  Widget _tile(BuildContext context, String title, String path, Color color, Widget page) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
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
              child: Image.asset(path, height: 120, width: double.infinity, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.balooBhai2(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
