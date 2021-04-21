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
          title: Text('Row Demo'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Text('Google Flutter'),
                ],
              ),
            ),
            Text('Development By Google Inc.'),
          ],
        ),
      ),
    );
  }
}
