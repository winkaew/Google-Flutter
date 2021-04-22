import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Tooltip Demo')),
        body: const Center(
          child: MyStatelessWidget(),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Tooltip : Greeting',
      child: const Text('Welcome to Google Flutter.'),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey,
        /*
        gradient:
        const LinearGradient(colors: <Color>[Colors.blue, Colors.purple]),
        */
      ),
      height: 50,
      padding: const EdgeInsets.all(8.0),
      preferBelow: false,
      textStyle: const TextStyle(
        fontSize: 18,
      ),
      showDuration: const Duration(seconds: 2),
      waitDuration: const Duration(seconds: 1),
    );
  }
}
