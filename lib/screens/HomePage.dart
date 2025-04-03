import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0), // Soft pastel background
      appBar: AppBar(
        title: Text(
          'કિલોલ - રમત અને શિક્ષણ', // Title in Gujarati
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Welcome text
            Text(
              'સ્વાગત છે, બાળકો! 🚀',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),

            // Grid Menu for Sections
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildCategoryTile(context, 'અક્ષરો', 'assets/images/k.png', Colors.blue),
                  _buildCategoryTile(context, 'ગણિત', 'assets/icons/math.png', Colors.red),
                  _buildCategoryTile(context, 'પ્રાણીઓ', 'assets/icons/animals.png', Colors.green),
                  _buildCategoryTile(context, 'આકૃતિઓ', 'assets/icons/shapes.png', Colors.purple),
                  _buildCategoryTile(context, 'ભાવનાઓ', 'assets/icons/emotions.png', Colors.orange),
                  _buildCategoryTile(context, 'સંસ્કાર', 'assets/icons/values.png', Colors.teal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Category Buttons with Image Covering Box & Text Below
  Widget _buildCategoryTile(BuildContext context, String title, String imagePath, Color color) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: double.infinity, // Ensures width adapts properly
            height: 100, // Square box
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // Ensures image covers the square properly
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
