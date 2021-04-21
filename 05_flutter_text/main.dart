import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  double customFontSize = 16;

  void AddFontSize() async {
    setState(() {
      customFontSize += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // เอา Debug Banner ออก
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Demo'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Native Cross-Platform with Google Flutter',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: customFontSize),
              ),
              ElevatedButton(
                // RaisedButton is Deprecated
                onPressed: () {
                  AddFontSize();
                },
                child: Text('+'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
