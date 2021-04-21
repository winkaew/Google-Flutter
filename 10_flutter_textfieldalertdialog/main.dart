import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TextField Alert Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: TextFieldAlertDialog(),
    );
  }
}

class TextFieldAlertDialog extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alert Dialog'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Please Enter a Message."),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                  print('Submit Action!!');
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Alert Dialog Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'TextField Alert',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () => _displayDialog(context),
        ),
      ),
    );
  }
}
