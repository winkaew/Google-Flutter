import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checkFirst = false;
  bool checkSecond = false;
  bool checkThird = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Checkbox Demo'),
        ),
        body: Container(
          padding: new EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                'Training Topic Register',
                style: TextStyle(fontSize: 24.0),
              ),
              CheckboxListTile(
                secondary: const Icon(Icons.book),
                title: const Text('Dart Programming'),
                subtitle: Text('12 Hours'),
                value: this.checkFirst,
                onChanged: (bool value) {
                  setState(() {
                    this.checkFirst = value;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(Icons.book),
                title: const Text('Google Flutter'),
                subtitle: Text('24 Hours'),
                value: this.checkSecond,
                onChanged: (bool value) {
                  setState(() {
                    this.checkSecond = value;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(Icons.book),
                title: const Text('React Native'),
                subtitle: Text('24 Hours'),
                value: this.checkThird,
                onChanged: (bool value) {
                  setState(() {
                    this.checkThird = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
