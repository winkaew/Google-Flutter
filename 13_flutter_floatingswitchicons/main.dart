import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  Icon myIcon = Icon(
    Icons.settings_voice,
  );

  int myIconNumber = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Floating Action Switch Icon Demo'),
          backgroundColor: Colors.orange.shade700,
        ),
        floatingActionButton: FloatingActionButton(
          child: myIcon,
          backgroundColor: Colors.orange.shade700,
          onPressed: () => setState(() {
            if (myIconNumber == 0) {
              myIcon = Icon(
                Icons.stop,
              );
              myIconNumber = 1;
            } else {
              myIcon = Icon(Icons.settings_voice);
              myIconNumber = 0;
            }
          }),
        ),
      ),
    );
  }
}
