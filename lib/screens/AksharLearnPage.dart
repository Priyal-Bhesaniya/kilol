import 'package:flutter/material.dart';

class AksharLearnPage extends StatefulWidget {
  @override
  _AksharLearnPageState createState() => _AksharLearnPageState();
}

class _AksharLearnPageState extends State<AksharLearnPage> {
  bool showSvar = true;
  bool showBarakshdi = false; // For Barakshdi toggle state
  String selectedLetter = 'અ';

  final Map<String, Map<String, String>> svarMap = {
    'અ': {'image': 'a.webp', 'name': 'અનાનસ'},
    'આ': {'image': 'aa.webp', 'name': 'આઈસ્ક્રીમ'},
    'ઇ': {'image': 'i.jpg', 'name': 'ઇસ્ત્રી'},
    'ઈ': {'image': 'ii.jpeg', 'name': 'ઈલાયચી'},
    'ઉ': {'image': 'u.jpeg', 'name': 'ઉંદર'},
    'ઊ': {'image': 'uu.jpeg', 'name': 'ઊન'},
    'એ': {'image': 'e.jpeg', 'name': 'એરપોર્ટ'},
    'ઐ': {'image': 'ai.jpeg', 'name': 'ઐતિહાસિક'},
    'ઓ': {'image': 'o.jpeg', 'name': 'ઓજાર'},
    'ઔ': {'image': 'au.jpg', 'name': 'ઔષધી'},
    'અં': {'image': 'am.jpeg', 'name': 'અંગૂઠી'},
    'અઃ': {'name': 'અઃકાર'},
  };

  final Map<String, Map<String, String>> vyanjanMap = {
    'ક': {'image': 'ka.jpeg', 'name': 'કબૂતર'},
    'ખ': {'image': 'kha.jpeg', 'name': 'ખટ|રો'},
    'ગ': {'image': 'ga.jpeg', 'name': 'ગાય'},
    'ઘ': {'image': 'gha.jpeg', 'name': 'ઘર'},
    'ચ': {'image': 'cha.jpg', 'name': 'ચકલી'},
    'છ': {'image': 'chha.jpg', 'name': 'છત્રી'},
    'જ': {'image': 'ja.jpg', 'name': 'જહાજ'},
    'ઝ': {'image': 'jha.jpg', 'name': 'ઝાડ'},
    'ટ': {'image': 'ta.webp', 'name': 'ટમેટા'},
    'ઠ': {'image': 'tha.jpeg', 'name': 'ઠંડું'},
    'ડ': {'image': 'da.webp', 'name': 'ડમરું'},
    'ઢ': {'image': 'dha.jpg', 'name': 'ઢોલ'},
    'ણ': {'image': 'na.png', 'name': 'ણમસાર'},
    'ત': {'image': 'ta2.png', 'name': 'તલવાર'},
    'થ': {'image': 'tha2.webp', 'name': 'થાળી'},
    'દ': {'image': 'da2.jpeg', 'name': 'દવાખાનું'},
    'ધ': {'image': 'dha2.jpg', 'name': 'ધનુષ'},
    'ન': {'image': 'na2.jpg', 'name': 'નળ'},
    'પ': {'image': 'pa.jpg', 'name': 'પપૈયું'},
    'ફ': {'image': 'pha.jpeg', 'name': 'ફૂલ'},
    'બ': {'image': 'ba.jpeg', 'name': 'બિલાડી'},
    'ભ': {'image': 'bha.jpg', 'name': 'ભમરડો'},
    'મ': {'image': 'ma.png', 'name': 'મરઘી'},
    'ય': {'image': 'ya.jpeg', 'name': 'યજ્ઞ'},
    'ર': {'image': 'ra.jpg', 'name': 'રોટલી'},
    'લ': {'image': 'la.webp', 'name': 'લીમડો'},
    'વ': {'image': 'va.jpg', 'name': 'વાંદરું'},
    'શ': {'image': 'sha.jpg', 'name': 'શરબત'},
    'ષ': {'image': 'sha2.png', 'name': 'ષટ્કોણ'},
    'સ': {'image': 'sa.jpg', 'name': 'સાપ'},
    'હ': {'image': 'ha.webp', 'name': 'હાથી'},
    'ળ': {'image': 'na2.jpg', 'name': 'નળ'},
    'ક્ષ': {'image': 'ksha.jpg', 'name': 'ક્ષત્રિય'},
    'જ્ઞ': {'image': 'gya.jpeg', 'name': 'જ્ઞાની'},
  };

  @override
  void initState() {
    super.initState();
    selectedLetter = showSvar ? svarMap.keys.first : vyanjanMap.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    final currentMap = showSvar
        ? svarMap
        : (showBarakshdi ? _getBarakshdiMap() : vyanjanMap);
    final selectedData = currentMap[selectedLetter]!;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text(
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
                // Left - Letters
                Container(
                  width: 120,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
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

                // Divider
                Container(
                  width: 1,
                  color: Colors.deepOrange.withOpacity(0.8),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                ),

                // Right - Big letter + image + name
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          selectedLetter,
                          style: const TextStyle(
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/letters/${selectedData['image']}',
                            height: 200,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text(
                                "Image not found",
                                style: TextStyle(color: Colors.red),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          selectedData['name']!,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.brown,
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
        _buildCategoryButton('વ્યંજન', !showSvar && !showBarakshdi, () {
          setState(() {
            showSvar = false;
            showBarakshdi = false;
            selectedLetter = vyanjanMap.keys.first;
          });
        }),
        const SizedBox(width: 16),
        _buildCategoryButton('બારક્ષડી', showBarakshdi, () {
          setState(() {
            showSvar = false;
            showBarakshdi = !showBarakshdi;
            selectedLetter = showBarakshdi ? 'ક' : vyanjanMap.keys.first;
          });
        }),
      ],
    );
  }

  Widget _buildCategoryButton(String label, bool isSelected, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.deepOrange : Colors.orange.shade200,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
            offset: const Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
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

  // Example Barakshdi map (you can replace with actual letters)
 Map<String, Map<String, String>> _getBarakshdiMap() {
  return {
    'ક': {'name': 'ક, કા, કિ, કી, કુ, કૂ, કે, કૈ, કો, કૌ, કં, કઃ', 'image': 'ka.jpeg'},
    'ખ': {'name': 'ખ, ખા, ખિ, ખી, ખુ, ખૂ, ખે, ખૈ, ખો, ખૌ, ખં, ખઃ', 'image': 'kha.jpeg'},
    'ગ': {'name': 'ગ, ગા, ગિ, ગી, ગુ, ગૂ, ગે, ગૈ, ગો, ગૌ, ગં, ગઃ', 'image': 'ga.jpeg'},
    'ઘ': {'name': 'ઘ, ઘા, ઘિ, ઘી, ઘુ, ઘૂ, ઘે, ઘૈ, ઘો, ઘૌ, ઘં, ઘઃ', 'image': 'gha.jpeg'},
    'ચ': {'name': 'ચ, ચા, ચિ, ચી, ચુ, ચૂ, ચે, ચૈ, ચો, ચૌ, ચં, ચઃ', 'image': 'cha.jpg'},
    'છ': {'name': 'છ, છા, છિ, છી, છુ, છૂ, છે, છૈ, છો, છૌ, છં, છઃ', 'image': 'chha.jpg'},
    'જ': {'name': 'જ, જા, જિ, જી, જુ, જૂ, જે, જૈ, જો, જૌ, જં, જઃ', 'image': 'ja.jpg'},
    'ઝ': {'name': 'ઝ, ઝા, ઝિ, ઝી, ઝુ, ઝૂ, ઝે, ઝૈ, ઝો, ઝૌ, ઝં, ઝઃ', 'image': 'jha.jpg'},
    'ટ': {'name': 'ટ, ટા, ટિ, ટી, ટુ, ટૂ, ટે, ટૈ, ટો, ટૌ, ટં, ટઃ', 'image': 'ta.webp'},
    'ઠ': {'name': 'ઠ, ઠા, ઠિ, ઠી, ઠુ, ઠૂ, ઠે, ઠૈ, ઠો, ઠૌ, ઠં, ઠઃ', 'image': 'tha.jpeg'},
    'ડ': {'name': 'ડ, ડા, ડિ, ડી, ડુ, ડૂ, ડે, ડૈ, ડો, ડૌ, ડં, ડઃ', 'image': 'da.webp'},
    'ઢ': {'name': 'ઢ, ઢા, ઢિ, ઢી, ઢુ, ઢૂ, ઢે, ઢૈ, ઢો, ઢૌ, ઢં, ઢઃ', 'image': 'dha.jpg'},
    'ણ': {'name': 'ણ, ણા, ણિ, ણી, ણુ, ણૂ, ણે, ણૈ, ણો, ણૌ, ણં, ણઃ', 'image': 'na.png'},
    'ત': {'name': 'ત, તા, તિ, તી, તુ, તૂ, તે, તૈ, તો, તૌ, તં, તઃ', 'image': 'ta2.png'},
    'થ': {'name': 'થ, થા, થિ, થી, થુ, થૂ, થે, થૈ, થો, થૌ, થં, થઃ', 'image': 'tha2.webp'},
    'દ': {'name': 'દ, દા, દિ, દી, દુ, દૂ, દે, દૈ, દો, દૌ, દં, દઃ', 'image': 'da2.jpeg'},
    'ધ': {'name': 'ધ, ધા, ધિ, ધી, ધુ, ધૂ, ધે, ધૈ, ધો, ધૌ, ધં, ધઃ', 'image': 'dha2.jpg'},
    'ન': {'name': 'ન, ના, નિ, ની, નુ, નૂ, ને, નૈ, નો, નૌ, નં, નઃ', 'image': 'na2.jpg'},
    'પ': {'name': 'પ, પા, પિ, પી, પુ, પૂ, પે, પૈ, પો, પૌ, પં, પઃ', 'image': 'pa.jpg'},
    'ફ': {'name': 'ફ, ફા, ફિ, ફી, ફુ, ફૂ, ફે, ફૈ, ફો, ફૌ, ફં, ફઃ', 'image': 'pha.jpeg'},
    'બ': {'name': 'બ, બા, બિ, બી, બુ, બૂ, બે, બૈ, બો, બૌ, બં, બઃ', 'image': 'ba.jpeg'},
    'ભ': {'name': 'ભ, ભા, ભિ, ભી, ભુ, ભૂ, ભે, ભૈ, ભો, ભૌ, ભં, ભઃ', 'image': 'bha.jpg'},
    'મ': {'name': 'મ, મા, મિ, મી, મુ, મૂ, મે, મૈ, મો, મૌ, મં, મઃ', 'image': 'ma.png'},
    'ય': {'name': 'ય, યા, યિ, યી, યુ, યૂ, યે, યૈ, યો, યૌ, યં, યઃ', 'image': 'ya.jpeg'},
    'ર': {'name': 'ર, રા, રિ, રી, રુ, રૂ, રે, રૈ, રો, રૌ, રં, રઃ', 'image': 'ra.jpg'},
    'લ': {'name': 'લ, લા, લિ, લી, લુ, લૂ, લે, લૈ, લો, લૌ, લં, લઃ', 'image': 'la.webp'},
    'વ': {'name': 'વ,વા, વિ, વી, વુ, વૂ, વે, વૈ, વો, વૌ, વં, વઃ', 'image': 'va.jpg'},
    'શ': {'name': 'શ, શા, શિ, શી, શુ, શૂ, શે, શૈ, શો, શૌ, શં, શઃ', 'image': 'sha.jpg'},
    'ષ': {'name': 'ષ, ષા, ષિ, ષી, ષુ, ષૂ, ષે, ષૈ, ષો, ષૌ, ષં, ષઃ', 'image': 'sha2.png'},
    'સ': {'name': 'સ, સાઇ, સિ, સી, સુ, સૂ, સે, સૈ, સો, સૌ, સં, સઃ', 'image': 'sa.jpg'},
    'હ': {'name': 'હ, હા, હિ, હી, હુ, હૂ, હે, હૈ, હો, હૌ, હં, હઃ', 'image': 'ha.webp'},
    'ળ': {'name': 'ળ, ળા, ળિ, ળી, ળુ, ળૂ, ળે, ળૈ, ળો, ળૌ, ળં, ળઃ', 'image': 'la2.jpg'},
    'ક્ષ': {'name': 'ક્ષ, ક્ષા, ક્ષિ, ક્ષી, ક્ષુ, ક્ષૂ, ક્ષે, ક્ષૈ, ક્ષો, ક્ષૌ, ક્ષં, ક્ષઃ', 'image': 'ksha.jpg'},
    'જ્ઞ': {'name': 'જ્ઞ, જ્ઞા, જ્ઞિ, જ્ઞી, જ્ઞુ, જ્ઞૂ, જ્ઞે, જ્ઞૈ, જ્ઞો, જ્ઞૌ, જ્ઞં, જ્ઞઃ', 'image': 'gya.jpeg'},
  };
}

}
