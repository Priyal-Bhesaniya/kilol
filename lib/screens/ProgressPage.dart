import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async'; // Import for Timer

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  double _progress = 0; // Start progress at 0
  late Timer _timer;
  late Stopwatch _stopwatch;
  bool _isTracking = false; // Flag to track if progress is being measured

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void _startTrackingProgress() {
    setState(() {
      _isTracking = true;
    });
    _stopwatch.start();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_stopwatch.elapsed.inSeconds >= 1 && _progress < 100) {
        setState(() {
          _progress = (_stopwatch.elapsed.inSeconds / 60) * 100; // Increases progress by 1% for each 1 minute
        });
      }
    });
  }

  void _stopTrackingProgress() {
    _stopwatch.stop();
    _timer.cancel();
    setState(() {
      _isTracking = false;
    });
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'બાળકનો પ્રગતિ પૃષ્ઠ',
          style: GoogleFonts.balooBhai2(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'પ્રગતિ દૃશ્યમાન છે',
              style: GoogleFonts.balooBhai2(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Progress Tile for each activity
            ProgressTile(title: 'અક્ષર શીખવું', progress: _progress),
            ProgressTile(title: 'ગણિત', progress: _progress),
            ProgressTile(title: 'પ્રાણીઓ', progress: _progress),
            ProgressTile(title: 'આકૃતિઓ', progress: _progress),
            ProgressTile(title: 'ભાવનાઓ', progress: _progress),

            // Start/Stop Progress Button
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isTracking ? _stopTrackingProgress : _startTrackingProgress,
              child: Text(_isTracking ? 'વિસ્તૃત કાર્ય પૂરું થયું!' : 'પ્રગતિ શરુ કરો'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressTile extends StatelessWidget {
  final String title;
  final double progress;

  const ProgressTile({required this.title, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.balooBhai2(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${progress.toStringAsFixed(0)}%',
                style: GoogleFonts.balooBhai2(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              // Progress bar
              Container(
                width: 200,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: LinearProgressIndicator(
                  value: progress / 100, // Progress as a fraction
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
