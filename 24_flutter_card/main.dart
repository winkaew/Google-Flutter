import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Card Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Picture # 1'),
                  subtitle: Text(
                    'Thailand',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Phang-Nga is a province in southern Thailand.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("Thailand Action : Detail");
                      },
                      child: const Text('Detail'),
                    ),
                    TextButton(
                      onPressed: () {
                        print("Thailand Action : More");
                      },
                      child: const Text('More'),
                    ),
                  ],
                ),
                Image.asset('assets/card-sample-image.jpg'),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Picture # 2'),
                  subtitle: Text(
                    'United State',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'A forest is an area of land dominated by trees.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("USA Action : Detail");
                      },
                      child: const Text('Detail'),
                    ),
                    TextButton(
                      onPressed: () {
                        print("USA Action : More");
                      },
                      child: const Text('More'),
                    ),
                  ],
                ),
                Image.asset('assets/card-sample-image-2.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


