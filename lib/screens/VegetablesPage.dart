import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../main.dart'; // Make sure AppLanguage is here

class VegetablesPage extends StatelessWidget {
  final List<Map<String, Map<String, String>>> vegetables = [
    {
      'name': {'en': 'Tomato', 'hi': 'टमाटर', 'gu': 'ટમેટું'},
      'lottie': {'en': 'assets/animation/tomato.json'},
    },
    {
      'name': {'en': 'Potato', 'hi': 'आलू', 'gu': 'બટાકું'},
      'lottie': {'en': 'assets/images/potato.jpg'},
    },
    {
      'name': {'en': 'Carrot', 'hi': 'गाजर', 'gu': 'ગાજર'},
      'lottie': {'en': 'assets/animation/vegi1.json'},
    },
    {
      'name': {'en': 'Brinjal', 'hi': 'बैंगन', 'gu': 'રીંગણ'},
      'lottie': {'en': 'assets/animation/bringle.json'},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        title: const Text('શાકભાજી', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DropdownButton<String>(
              value: AppLanguage.lang.value,
              dropdownColor: Colors.lightGreen,
              icon: const Icon(Icons.language, color: Colors.white),
              underline: const SizedBox(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'hi', child: Text('हिंदी')),
                DropdownMenuItem(value: 'gu', child: Text('ગુજરાતી')),
              ],
              onChanged: (value) {
                if (value != null) {
                  AppLanguage.lang.value = value; // Updates the language
                }
              },
            ),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: AppLanguage.lang,
        builder: (context, String lang, _) {
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: vegetables.length,
            itemBuilder: (context, index) {
              final veg = vegetables[index];
              final isLottie = veg['lottie']!['en']!.endsWith('.json');

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
                              veg['lottie']!['en']!,
                              height: 200,
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              veg['lottie']!['en']!,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                      const SizedBox(height: 12),
                      Text(
                        veg['name']![lang]!, // Dynamic language here
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
          );
        },
      ),
    );
  }
}
