import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Option Alert Dialog Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final Framework frameworkName =
                    await _asyncSimpleDialog(context);
                print("Framework Selected : $frameworkName");
              },
              child: const Text(
                "Option Alert",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Framework { Flutter, React, Xamarin }

Future<Framework> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Framework>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Framework : '),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Framework.Flutter);
              },
              child: const Text('Google Flutter'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Framework.React);
              },
              child: const Text('React Native'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Framework.Xamarin);
              },
              child: const Text('Xamarin C#'),
            ),
          ],
        );
      });
}
