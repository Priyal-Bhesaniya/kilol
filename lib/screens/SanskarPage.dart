import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Sanskarpage extends StatefulWidget {
  const Sanskarpage({super.key});

  @override
  State<Sanskarpage> createState() => _SanskarpageState();
}

class _SanskarpageState extends State<Sanskarpage> {
  final AudioPlayer player = AudioPlayer();

  final List<Map<String, String>> sanskars = [
    {
      'title': 'નમસ્તે',
      'desc': 'મોટાઓને મળતા નમસ્તે કરો',
      'icon': 'assets/images/namste.jpg',
      'audio':'adar1.mp3',
      
    },
    {
      'title': 'આદર',
      'desc': 'માતા-પિતા અને ગુરુજનોને આદર આપો',
      'icon': 'assets/images/n2.webp',
      'audio':'adar2.mp3',
      
    },
    {
      'title': 'Good Touch',
      'desc': 'હગ, પીઠ પર થપક – સારો સ્પર્શ',
      'icon': 'assets/images/goodtouch.png',
      'audio':'adar3.mp3',
    
    },
    {
      'title': 'Good Touch',
      'desc': 'હગ, પીઠ પર થપક – સારો સ્પર્શ',
      'icon': 'assets/images/goodtouch2.png',
      'audio':'adar3.mp3',
    
    },
    {
      'title': 'Good Touch',
      'desc': 'હગ, પીઠ પર થપક – સારો સ્પર્શ',
      'icon': 'assets/images/goodtouch3.png',
      'audio':'adar3.mp3',
    
    },
    {
      'title': 'Bad Touch',
      'desc': 'જ્યાં દુઃખ થાય એવો સ્પર્શ – નહીં કહો!',
      'icon': 'assets/images/badtouch.png',
      'audio':'adar4.mp3',
      
    },
    {
      'title': 'Bad Touch',
      'desc': 'જ્યાં દુઃખ થાય એવો સ્પર્શ – નહીં કહો!',
      'icon': 'assets/images/badtouch2.png',
      'audio':'adar4.mp3',
      
    },
    {
      'title': 'Bad Touch',
      'desc': 'જ્યાં દુઃખ થાય એવો સ્પર્શ – નહીં કહો!',
      'icon': 'assets/images/badtouch3.png',
      'audio':'adar4.mp3',
      
    },
  ];

  void _playSound(String? fileName) {
    if (fileName != null) {
      player.play(AssetSource('audio/$fileName'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text('સંસ્કાર', style: TextStyle(color: Colors.white, fontSize: 24)),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: sanskars.length,
        itemBuilder: (context, index) {
          final item = sanskars[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: Colors.orange.shade50,
            child: InkWell(
              onTap: () => _playSound(item['audio']),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  children: [
                    // Image icon (larger size)
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        item['icon'] ?? 'assets/icons/default.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Title Text under image
                    Text(
                      item['title'] ?? '',
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                    ),
                    const SizedBox(height: 6),
                    // Description Text under title
                    Text(
                      item['desc'] ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 12),
                    // Volume Icon under the description text
                    IconButton(
                      icon: const Icon(Icons.volume_up, size: 36, color: Colors.deepOrange),
                      onPressed: () => _playSound(item['audio']),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
