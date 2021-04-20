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
          title: Text('Form Demo'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),

            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.work),
              hintText: 'Enter a Department',
              labelText: 'Department',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a department';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a phone number';
              }
              return null;
            },
          ),
          new Container(
            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
            child: new ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Data Complete'),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
