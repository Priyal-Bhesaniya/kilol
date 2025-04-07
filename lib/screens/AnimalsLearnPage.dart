import 'package:flutter/material.dart';
import 'package:kilol/screens/LandAnimalsPage.dart';

class AnimalsLearnPage extends StatelessWidget {
  const AnimalsLearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text('પ્રાણીના પ્રકાર',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            
            _buildAnimalCategoryCard(
              context,
              title: 'જમીન પર રહેતાં પ્રાણીઓ',
              icon: Icons.landscape,
              color: Colors.green.shade100,
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) =>LandAnimalsPage() ),
  );
},
            ),
            const SizedBox(height: 20),
            _buildAnimalCategoryCard(
              context,
              title: 'પાણીમાં રહેતાં પ્રાણીઓ',
              icon: Icons.water,
              color: Colors.lightBlue.shade100,
              onTap: () {
                // Navigate to Water Animals List Page
              },
            ),
            const SizedBox(height: 20),
            _buildAnimalCategoryCard(
              context,
              title: 'હવામાં ઉડતાં પ્રાણીઓ',
              icon: Icons.flight,
              color: Colors.purple.shade100,
              onTap: () {
                // Navigate to Flying Animals List Page
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalCategoryCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: color,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.deepOrange),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.deepOrange),
            ],
          ),
        ),
      ),
    );
  }
}
