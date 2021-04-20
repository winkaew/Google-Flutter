import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'AppBar Demo',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true, // ให้ข้อความอยู่กึ่งกลาง AppBar
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_alert),
              onPressed: null,
            )
          ],
          backgroundColor: Colors.orange.shade700,
        ),
        body: Container(),
      ),
    );
  }
}
