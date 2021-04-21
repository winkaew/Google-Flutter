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
            backgroundColor: Colors.blue,
            title: Text("Switch Demo"),
          ),
          body: Center(child: SwitchScreen()),
        ));
  }
}

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Switch : Off';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch : On';
      });
      print('Switch : On');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch : Off';
      });
      print('Switch : Off');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 2,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.black,
            activeTrackColor: Colors.grey,
            inactiveThumbColor: Colors.deepPurpleAccent,
            inactiveTrackColor: Colors.blue,
          )),
      Text(
        '$textValue',
        style: TextStyle(fontSize: 18),
      )
    ]);
  }
}
