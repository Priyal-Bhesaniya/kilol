import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AksharTestPage extends StatefulWidget {
  @override
  _AksharTestPageState createState() => _AksharTestPageState();
}

class _AksharTestPageState extends State<AksharTestPage> {
  bool showSvar = true;
  bool showSuccessOverlay = false;
  bool showFailOverlay = false;

  final AudioPlayer _audioPlayer = AudioPlayer();

  final Map<String, Map<String, String>> svarMap = {
    'અ': {'image': 'a.webp', 'name': 'અનાનસ'},
    'આ': {'image': 'aa.webp', 'name': 'આઈસ્ક્રીમ'},
    'ઇ': {'image': 'i.jpg', 'name': 'ઇસ્ત્રી'},
    'ઈ': {'image': 'ii.jpeg', 'name': 'ઈલાયચી'},
    'ઉ': {'image': 'u.jpeg', 'name': 'ઉંદર'},
  };

  final Map<String, Map<String, String>> vyanjanMap = {
    'ક': {'image': 'ka.jpeg', 'name': 'કબૂતર'},
    'ખ': {'image': 'kha.jpeg', 'name': 'ખટારો'},
    'ગ': {'image': 'ga.jpeg', 'name': 'ગાય'},
    'ઘ': {'image': 'gha.jpeg', 'name': 'ઘર'},
    'ચ': {'image': 'cha.jpg', 'name': 'ચકલી'},
  };

  void checkAnswer(String selected, String correctAnswer) async {
    bool isCorrect = selected == correctAnswer;
    setState(() {
      showSuccessOverlay = isCorrect;
      showFailOverlay = !isCorrect;
    });

    await _audioPlayer.stop();
    await _audioPlayer.play(
      AssetSource('audio/${isCorrect ? 'good.mp3' : 'bad.mp3'}'),
    );

    Timer(Duration(seconds: 2), () {
      setState(() {
        showSuccessOverlay = false;
        showFailOverlay = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentMap = showSvar ? svarMap : vyanjanMap;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'પરીક્ષા',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFFFF8E1),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildToggleButtons(),
                const SizedBox(height: 20),
                _buildQuizCard('Image to Letter', currentMap),
                const SizedBox(height: 20),
                _buildQuizCard('Letter to Image', currentMap),
                const SizedBox(height: 20),
                _buildQuizCard('Match Name', currentMap),
              ],
            ),
          ),
          if (showSuccessOverlay)
            _buildOverlay('🎉 ખુબ જ સારું!', Colors.green),
          if (showFailOverlay)
            _buildOverlay('❌ ફરી પ્રયાસ કરો', Colors.red),
        ],
      ),
    );
  }

  Widget _buildOverlay(String message, Color bgColor) {
    return Container(
      color: bgColor.withOpacity(0.9),
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
          });
        }),
        const SizedBox(width: 12),
        _buildCategoryButton('વ્યંજન', !showSvar, () {
          setState(() {
            showSvar = false;
          });
        }),
      ],
    );
  }

  Widget _buildCategoryButton(
      String label, bool isSelected, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? Colors.deepOrange : Colors.orange.shade200,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildQuizCard(
      String quizType, Map<String, Map<String, String>> currentMap) {
    final random = Random();
    final keys = currentMap.keys.toList();
    final letter = keys[random.nextInt(keys.length)];
    final data = currentMap[letter]!;

    String question = '';
    List<Widget> optionWidgets = [];
    String answer = '';

    if (quizType == 'Image to Letter') {
      question = 'આ છબી કયા અક્ષરથી શરૂ થાય છે?';
      String img = data['image']!;
      answer = letter;

      List<String> options = [letter];
      while (options.length < 4) {
        String rand = keys[random.nextInt(keys.length)];
        if (!options.contains(rand)) options.add(rand);
      }
      options.shuffle();

      optionWidgets = options
          .map((opt) => _buildOptionCard(opt, () => checkAnswer(opt, answer)))
          .toList();

      return _buildCard(
          question,
          Image.asset('assets/images/letters/$img', height: 180),
          optionWidgets);
    }

    if (quizType == 'Letter to Image') {
      question = 'આ અક્ષર માટે યોગ્ય છબી પસંદ કરો: "$letter"';
      answer = data['image']!;

      List<String> images = [answer];
      while (images.length < 4) {
        String randImg =
            currentMap[keys[random.nextInt(keys.length)]]!['image']!;
        if (!images.contains(randImg)) images.add(randImg);
      }
      images.shuffle();

      optionWidgets = images
          .map((img) => GestureDetector(
                onTap: () => checkAnswer(img, answer),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/letters/$img',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList();

      return _buildCard(
        question,
        Text(letter,
            style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold)),
        optionWidgets,
      );
    }

    if (quizType == 'Match Name') {
      question = 'નામ પરથી સાચું અક્ષર ઓળખો: "${data['name']}"';
      answer = letter;

      List<String> options = [letter];
      while (options.length < 4) {
        String rand = keys[random.nextInt(keys.length)];
        if (!options.contains(rand)) options.add(rand);
      }
      options.shuffle();

      optionWidgets = options
          .map((opt) => _buildOptionCard(opt, () => checkAnswer(opt, answer)))
          .toList();

      return _buildCard(
          question,
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/images/letters/${data['image']!}',
                height: 150),
          ),
          optionWidgets);
    }

    return Container();
  }

  Widget _buildCard(
      String title, Widget mainWidget, List<Widget> optionsWidgets) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange)),
            const SizedBox(height: 12),
            Center(child: mainWidget),
            const SizedBox(height: 16),
            Wrap(spacing: 12, runSpacing: 12, children: optionsWidgets),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepOrange, width: 2),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepOrange),
        ),
      ),
    );
  }
}
