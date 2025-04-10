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
      'audio': 'namaste.mp3'
    },
    {
      'title': 'આદર',
      'desc': 'માતા-પિતા અને ગુરુજનોને આદર આપો',
      'icon': 'assets/icons/respect.png',
      'audio': 'respect.mp3'
    },
    {
      'title': 'સારો સ્પર્શ',
      'desc': 'હગ, પીઠ પર થપક – સારો સ્પર્શ',
      'icon': 'assets/icons/good_touch.png',
      'audio': 'good_touch.mp3'
    },
    {
      'title': 'ખરાબ સ્પર્શ',
      'desc': 'જ્યાં દુઃખ થાય એવો સ્પર્શ – નહીં કહો!',
      'icon': 'assets/icons/bad_touch.png',
      'audio': 'bad_touch.mp3'
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
        title: const Text('સંસ્કાર', style: TextStyle(color: Colors.white, fontSize: 22)),
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
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image icon
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        item['icon'] ?? 'assets/icons/default.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] ?? '',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['desc'] ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.volume_up, size: 30, color: Colors.deepOrange),
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
