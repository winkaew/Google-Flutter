import 'package:flutter/material.dart';
import 'package:flutter_sqliteoperation/db_helper.dart';
import 'package:flutter_sqliteoperation/employee_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmployeePage(),
    );
  }
}

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<Employee>> employees;
  String _employeeName;
  bool isUpdate = false;
  int employeeIdForUpdate;
  DBHelper dbHelper;
  final _employeeNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshEmployeeList();
  }

  refreshEmployeeList() {
    setState(() {
      employees = dbHelper.getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formStateKey,
            //autovalidate: true,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Employee Name';
                      }
                      if (value.trim() == "")
                        return "Not Valid!!!";
                      return null;
                    },
                    onSaved: (value) {
                      _employeeName = value;
                    },
                    controller: _employeeNameController,
                    decoration: InputDecoration(
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid)),
                        labelText: "Employee Name",
                        icon: Icon(
                          Icons.business_center,
                          color: Colors.blue,
                        ),
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                //color: Colors.purple,
                child: Text(
                  (isUpdate ? 'UPDATE' : 'ADD'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (isUpdate) {
                    if (_formStateKey.currentState.validate()) {
                      _formStateKey.currentState.save();
                      dbHelper
                          .update(Employee(employeeIdForUpdate, _employeeName))
                          .then((data) {
                        setState(() {
                          isUpdate = false;
                        });
                      });
                    }
                  } else {
                    if (_formStateKey.currentState.validate()) {
                      _formStateKey.currentState.save();
                      dbHelper.add(Employee(null, _employeeName));
                    }
                  }
                  _employeeNameController.text = '';
                  refreshEmployeeList();
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                //color: Colors.red,
                child: Text(
                  (isUpdate ? 'CANCEL UPDATE' : 'CLEAR'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _employeeNameController.text = '';
                  setState(() {
                    isUpdate = false;
                    employeeIdForUpdate = null;
                  });
                },
              ),
            ],
          ),
          const Divider(
            height: 5.0,
          ),
          Expanded(
            child: FutureBuilder(
              future: employees,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return generateList(snapshot.data);
                }
                if (snapshot.data == null || snapshot.data.length == 0) {
                  return Text('No Data Found');
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView generateList(List<Employee> employees) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: DataTable(
            columns: [
              DataColumn(
                label: Text('NAME'),
              ),
              DataColumn(
                label: Text('DELETE'),
              )
            ],
            rows: employees
                .map(
                  (employee) =>
                  DataRow(
                    cells: [
                      DataCell(
                        Text(employee.name),
                        onTap: () {
                          setState(() {
                            isUpdate = true;
                            employeeIdForUpdate = employee.id;
                          });
                          _employeeNameController.text = employee.name;
                        },
                      ),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            dbHelper.delete(employee.id);
                            refreshEmployeeList();
                          },
                        ),
                      )
                    ],
                  ),
            ).toList(),
      ),
    ),);
  }
}