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
        appBar: AppBar(title: Text('Table Demo')),
        body: MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Driver',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Country',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Team',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Lewis Hamilton')),
            DataCell(Text('GBR')),
            DataCell(Text(' Mercedes-AMG Petronas F1 Team')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Max Verstappen')),
            DataCell(Text('NED')),
            DataCell(Text('Aston Martin Red Bull Racing')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Carlos Sainz Jr.')),
            DataCell(Text('ESP')),
            DataCell(Text('McLaren F1 Team')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Alexander Albon Ansusinha')),
            DataCell(Text('THA')),
            DataCell(Text('Aston Martin Red Bull Racing')),
          ],
        ),
      ],
    );
  }
}