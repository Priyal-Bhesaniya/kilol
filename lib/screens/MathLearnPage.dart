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
  {'digit': '૨૧', 'gujarati': 'એકવીસ'},
  {'digit': '૨૨', 'gujarati': 'બાવીસ'},
  {'digit': '૨૩', 'gujarati': 'ત્રેવીસ'},
  {'digit': '૨૪', 'gujarati': 'ચોવીસ'},
  {'digit': '૨૫', 'gujarati': 'પચ્ચીસ'},
  {'digit': '૨૬', 'gujarati': 'છવીસ'},
  {'digit': '૨૭', 'gujarati': 'સત્તાવીસ'},
  {'digit': '૨૮', 'gujarati': 'અઠ્ઠાવીસ'},
  {'digit': '૨૯', 'gujarati': 'ઓગણત્રીસ'},
  {'digit': '૩૦', 'gujarati': 'ત્રીસ'},
  {'digit': '૩૧', 'gujarati': 'એકત્રીસ'},
  {'digit': '૩૨', 'gujarati': 'બત્રીસ'},
  {'digit': '૩૩', 'gujarati': 'ત્રેત્રીસ'},
  {'digit': '૩૪', 'gujarati': 'ચૌત્રીસ'},
  {'digit': '૩૫', 'gujarati': 'પંચત્રીસ'},
  {'digit': '૩૬', 'gujarati': 'છત્રીસ'},
  {'digit': '૩૭', 'gujarati': 'સત્તત્રીસ'},
  {'digit': '૩૮', 'gujarati': 'અઢત્રીસ'},
  {'digit': '૩૯', 'gujarati': 'ઓગણચાલીસ'},
  {'digit': '૪૦', 'gujarati': 'ચાલીસ'},
  {'digit': '૪૧', 'gujarati': 'એકચાલીસ'},
  {'digit': '૪૨', 'gujarati': 'બેચાલીસ'},
  {'digit': '૪૩', 'gujarati': 'ત્રેચાલીસ'},
  {'digit': '૪૪', 'gujarati': 'ચોંચાલીસ'},
  {'digit': '૪૫', 'gujarati': 'પંચચાલીસ'},
  {'digit': '૪૬', 'gujarati': 'છચાલીસ'},
  {'digit': '૪૭', 'gujarati': 'સત્તાચાલીસ'},
  {'digit': '૪૮', 'gujarati': 'અઢચાલીસ'},
  {'digit': '૪૯', 'gujarati': 'ઓગણપચાસ'},
  {'digit': '૫૦', 'gujarati': 'પચાસ'},
  {'digit': '૫૧', 'gujarati': 'એકાવન'},
  {'digit': '૫૨', 'gujarati': 'બાવન'},
  {'digit': '૫૩', 'gujarati': 'ત્રેપન'},
  {'digit': '૫૪', 'gujarati': 'ચોપન'},
  {'digit': '૫૫', 'gujarati': 'પંચાવન'},
  {'digit': '૫૬', 'gujarati': 'છપ્પન'},
  {'digit': '૫૭', 'gujarati': 'સત્તાવન'},
  {'digit': '૫૮', 'gujarati': 'અઠ્ઠાવન'},
  {'digit': '૫૯', 'gujarati': 'ઓગણસાઠ'},
  {'digit': '૬૦', 'gujarati': 'સાઠ'},
  {'digit': '૬૧', 'gujarati': 'એકસઠ'},
  {'digit': '૬૨', 'gujarati': 'બેસઠ'},
  {'digit': '૬૩', 'gujarati': 'ત્રેસઠ'},
  {'digit': '૬૪', 'gujarati': 'ચોસઠ'},
  {'digit': '૬૫', 'gujarati': 'પાંસઠ'},
  {'digit': '૬૬', 'gujarati': 'છાસઠ'},
  {'digit': '૬૭', 'gujarati': 'સત્તાસઠ'},
  {'digit': '૬૮', 'gujarati': 'અઢસઠ'},
  {'digit': '૬૯', 'gujarati': 'ઓગણસિત્તેર'},
  {'digit': '૭૦', 'gujarati': 'સિત્તેર'},
  {'digit': '૭૧', 'gujarati': 'એકોત્તર'},
  {'digit': '૭૨', 'gujarati': 'બોત્તર'},
  {'digit': '૭૩', 'gujarati': 'ત્રેત્તર'},
  {'digit': '૭૪', 'gujarati': 'ચોત્તર'},
  {'digit': '૭૫', 'gujarati': 'પંચોત્તર'},
  {'digit': '૭૬', 'gujarati': 'છોત્તર'},
  {'digit': '૭૭', 'gujarati': 'સત્તોત્તર'},
  {'digit': '૭૮', 'gujarati': 'અઠ્ઠોત્તર'},
  {'digit': '૭૯', 'gujarati': 'ઓગણૈંસી'},
  {'digit': '૮૦', 'gujarati': 'એંસી'},
  {'digit': '૮૧', 'gujarati': 'એક્યાસી'},
  {'digit': '૮૨', 'gujarati': 'બ્યાસી'},
  {'digit': '૮૩', 'gujarati': 'ત્ર્યાસી'},
  {'digit': '૮૪', 'gujarati': 'ચોર્યાસી'},
  {'digit': '૮૫', 'gujarati': 'પંચ્યાસી'},
  {'digit': '૮૬', 'gujarati': 'છ્યાસી'},
  {'digit': '૮૭', 'gujarati': 'સત્ત્યાસી'},
  {'digit': '૮૮', 'gujarati': 'અઠ્ઠ્યાસી'},
  {'digit': '૮૯', 'gujarati': 'ઓગણનવ્વા'},
  {'digit': '૯૦', 'gujarati': 'નવ્વા'},
  {'digit': '૯૧', 'gujarati': 'એકાણું'},
  {'digit': '૯૨', 'gujarati': 'બાણું'},
  {'digit': '૯૩', 'gujarati': 'ત્રાણું'},
  {'digit': '૯૪', 'gujarati': 'ચોરાણું'},
  {'digit': '૯૫', 'gujarati': 'પંચાણું'},
  {'digit': '૯૬', 'gujarati': 'છન્નું'},
  {'digit': '૯૭', 'gujarati': 'સત્તાણું'},
  {'digit': '૯૮', 'gujarati': 'અઠ્ઠાણું'},
  {'digit': '૯૯', 'gujarati': 'નેવ્વાણું'},
  {'digit': '૧૦૦', 'gujarati': 'સો'},
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
