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
          title: const Text('Radio Button Demo'),
        ),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

enum Course { Angular, React, Vue }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Course _site = Course.Angular;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Web Development using Angular'),
          leading: Radio(
            value: Course.Angular,
            groupValue: _site,
            onChanged: (Course value) {
              print('Framework : Angular');
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Web Development using React'),
          leading: Radio(
            value: Course.React,
            groupValue: _site,
            onChanged: (Course value) {
              print('Framework : React');
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Web Development using Vue'),
          leading: Radio(
            value: Course.Vue,
            groupValue: _site,
            onChanged: (Course value) {
              print('Framework : Vue');
              setState(() {
                _site = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
