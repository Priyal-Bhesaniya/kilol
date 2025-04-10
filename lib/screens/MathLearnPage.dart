import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Mathlearnpage extends StatefulWidget {
  const Mathlearnpage({super.key});

  @override
  State<Mathlearnpage> createState() => _MathlearnpageState();
}

class _MathlearnpageState extends State<Mathlearnpage> {
  final List<Map<String, String>> numbers = [
     {'digit': '૧', 'gujarati': 'એક'},
  {'digit': '૨', 'gujarati': 'બે'},
  {'digit': '૩', 'gujarati': 'ત્રણ'},
  {'digit': '૪', 'gujarati': 'ચાર'},
  {'digit': '૫', 'gujarati': 'પાંચ'},
  {'digit': '૬', 'gujarati': 'છ'},
  {'digit': '૭', 'gujarati': 'સાત'},
  {'digit': '૮', 'gujarati': 'આઠ'},
  {'digit': '૯', 'gujarati': 'નવ'},
  {'digit': '૧૦', 'gujarati': 'દસ'},
  {'digit': '૧૧', 'gujarati': 'અગિયાર'},
  {'digit': '૧૨', 'gujarati': 'બાર'},
  {'digit': '૧૩', 'gujarati': 'તેર'},
  {'digit': '૧૪', 'gujarati': 'ચૌદ'},
  {'digit': '૧૫', 'gujarati': 'પંદર'},
  {'digit': '૧૬', 'gujarati': 'સોળ'},
  {'digit': '૧૭', 'gujarati': 'સત્તર'},
  {'digit': '૧૮', 'gujarati': 'અઢાર'},
  {'digit': '૧૯', 'gujarati': 'ઓગણીસ'},
  {'digit': '૨૦', 'gujarati': 'વિસ'},
  ];

  final player = AudioPlayer();
  String selectedDigit = '';
  String selectedGujarati = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ગણિત અભ્યાસ',
        style: TextStyle(
          color:  Colors.white,
        ),),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFE1F5FE),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Big Number Display
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: selectedDigit.isNotEmpty
                ? Column(
                    key: ValueKey(selectedDigit),
                    children: [
                      Text(
                        selectedDigit,
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        selectedGujarati,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(height: 100),
          ),
          const SizedBox(height: 20),
          // Number Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: numbers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = numbers[index];
                  return GestureDetector(
                    onTap: () async {
                      setState(() {
                        selectedDigit = item['digit']!;
                        selectedGujarati = item['gujarati']!;
                      });
                      await _playSound(item['digit']!);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Colors.lightBlueAccent.shade100,
                      elevation: 4,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['digit']!,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['gujarati']!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _playSound(String digit) async {
    try {
      await player.play(AssetSource('audio/$digit.mp3'));
    } catch (e) {
      print('Sound play error: $e');
    }
  }
}
