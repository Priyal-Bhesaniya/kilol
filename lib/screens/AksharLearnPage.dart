import 'package:flutter/material.dart';

class AksharLearnPage extends StatefulWidget {
  @override
  _AksharLearnPageState createState() => _AksharLearnPageState();
}

class _AksharLearnPageState extends State<AksharLearnPage> {
  bool showSvar = true;
  String selectedLetter = 'અ';

  final Map<String, String> svarMap = {
    'અ': 'a.png', 'આ': 'aa.png', 'ઇ': 'i.png', 'ઈ': 'ii.png',
    'ઉ': 'u.png', 'ઊ': 'uu.png', 'એ': 'e.png', 'ઐ': 'ai.png',
    'ઓ': 'o.png', 'ઔ': 'au.png', 'અં': 'am.png', 'અઃ': 'aha.png',
  };

  final Map<String, String> vyanjanMap = {
    'ક': 'ka.png', 'ખ': 'kha.png', 'ગ': 'ga.png', 'ઘ': 'gha.png',
    'ચ': 'cha.png', 'છ': 'chha.png', 'જ': 'ja.png', 'ઝ': 'jha.png',
    'ટ': 'ta.png', 'ઠ': 'tha.png', 'ડ': 'da.png', 'ઢ': 'dha.png',
    'ણ': 'na.png', 'ત': 'ta2.png', 'થ': 'tha2.png', 'દ': 'da2.png',
    'ધ': 'dha2.png', 'ન': 'na2.png', 'પ': 'pa.png', 'ફ': 'pha.png',
    'બ': 'ba.png', 'ભ': 'bha.png', 'મ': 'ma.png', 'ય': 'ya.png',
    'ર': 'ra.png', 'લ': 'la.png', 'વ': 'va.png', 'શ': 'sha.png',
    'ષ': 'sha2.png', 'સ': 'sa.png', 'હ': 'ha.png', 'ળ': 'la2.png',
    'ક્ષ': 'ksha.png', 'જ્ઞ': 'gya.png',
  };

  @override
  void initState() {
    super.initState();
    selectedLetter = showSvar ? svarMap.keys.first : vyanjanMap.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    final currentMap = showSvar ? svarMap : vyanjanMap;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: Text(
          'અક્ષરો અભ્યાસ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _buildToggleButtons(),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              children: [
                // Left Section - Vertical letter list
                Container(
                  width: 120,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  child: ListView.builder(
                    itemCount: currentMap.length,
                    itemBuilder: (context, index) {
                      String letter = currentMap.keys.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLetter = letter;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: _buildLetterCard(letter, isSelected: letter == selectedLetter),
                        ),
                      );
                    },
                  ),
                ),

                // Vertical Divider
                Container(
                  width: 1,
                  color: Colors.deepOrange.withOpacity(0.8),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                ),

                // Right Section - Large letter & image
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          selectedLetter,
                          style: TextStyle(
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/letters/${currentMap[selectedLetter]}',
                            height: 200,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(
                                "Image not found",
                                style: TextStyle(color: Colors.red),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCategoryButton('સ્વર', showSvar, () {
          setState(() {
            showSvar = true;
            selectedLetter = svarMap.keys.first;
          });
        }),
        const SizedBox(width: 16),
        _buildCategoryButton('વ્યંજન', !showSvar, () {
          setState(() {
            showSvar = false;
            selectedLetter = vyanjanMap.keys.first;
          });
        }),
      ],
    );
  }

  Widget _buildCategoryButton(String label, bool isSelected, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.deepOrange : Colors.orange.shade200,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: isSelected ? 6 : 2,
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildLetterCard(String letter, {bool isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepOrange : Colors.orange.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.deepOrangeAccent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade200,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
