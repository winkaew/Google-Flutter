import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _ToastState createState() {
    return _ToastState();
  }
}

class _ToastState extends State {
  void showToast() {
    Fluttertoast.showToast(
      msg: 'Welcome to Google Flutter',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Toast Demo'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: ElevatedButton(
                child: Text('Click'),
                onPressed: showToast,
              ),
            ),
          )),
    );
  }
}
