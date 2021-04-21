import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Body Container Demo'),
          backgroundColor: Colors.orange.shade700,
        ),
        body: Container(
          child: Text(
            'Welcome to Google Flutter Widgets. This is Scaffold Demo for Beginner.',
            textAlign: TextAlign.justify,
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontSize: 22.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black45),
          ),
          color: Colors.grey,
        ),
      ),
    );
  }
}
