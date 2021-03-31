import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';
import 'package:tester/Screens/style.dart';

class AttendancePageStudent extends StatefulWidget {
  State<StatefulWidget> createState() {
    return AttendancePageStudentState();
  }
}

class AttendancePageStudentState extends State<AttendancePageStudent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: (Scaffold(
          backgroundColor: Colors.white,

          //body
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(alignment: Alignment.center),

            //Table container
            Container(
                //margin: EdgeInsets.fromLTRB(20, 100, 60, 0),
                child: Center(
                    child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Course Name ',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Absent',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Delayed',
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('OMR 312')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('OMR 511')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('OMR 611')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                  ],
                ),
              ],
            ))),
            //Back button
            SubmitButtons(
              text: "Download",
              onpressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("It downloaded successfully"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ]),
        )));
  }
}
