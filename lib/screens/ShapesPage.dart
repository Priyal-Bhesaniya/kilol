import 'package:flutter/material.dart';

class Shapespage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('અક્ષરો'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'અક્ષરો પેજમાં આપનું સ્વાગત છે!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
