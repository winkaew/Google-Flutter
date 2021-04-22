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
          title: Text("GridView Demo"),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: List.generate(
            choices.length,
            (index) {
              return Center(
                child: SelectCard(choice: choices[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'Photo', icon: Icons.photo),
  const Choice(title: 'List', icon: Icons.contacts),
  const Choice(title: 'Phone', icon: Icons.phone),
  const Choice(title: 'WiFi', icon: Icons.wifi),
  const Choice(title: 'Setting', icon: Icons.settings),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return Card(
      color: Colors.blue,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Icon(choice.icon, size: 45.0, color: textStyle.color)),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
