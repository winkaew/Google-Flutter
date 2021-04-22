import 'package:flutter/material.dart';
import './listscreen.dart';
import './photoscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs Demo'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contacts), text: "List"),
                Tab(icon: Icon(Icons.camera_alt), text: "Photo")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListScreen(),
              PhotoScreen(),
            ],
          ),
        ),
      ),
    );
  }
}