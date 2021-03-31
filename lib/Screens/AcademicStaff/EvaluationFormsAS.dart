import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/AcademicStaff/formsAS.dart';
import 'package:tester/Screens/AcademicStaff/homePageAS.dart';
import 'package:tester/Screens/Administrator/EFAdmin.dart';
import 'package:tester/Screens/style.dart';

class EvaluationFormsAS extends StatefulWidget {
  State<StatefulWidget> createState() {
    return EvaluationFormsASState();
  }
}

class EvaluationFormsASState extends State<EvaluationFormsAS> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFFD9D9D9),
            title: Text(
              "Evaluation Forms",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF525151),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                runApp(homepageAS());
              },
              color: Color(0xFF525151),
              iconSize: 20,
              padding: EdgeInsets.only(left: 20),
            ),
          ),
          body: ListView(
            children: [
              Align(alignment: Alignment.center),
              CoursesButtons(
                label: "Infiltration",
                color: Colors.red,
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: EvaluationFormInfo()));
                },
              ),
              CoursesButtons(
                label: "INAB",
                color: Color(0xFF98D1D4),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: EvaluationFormInfo()));
                },
              ),
              CoursesButtons(
                label: "Suturing",
                color: Color(0xFF98D1D4),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: EvaluationFormInfo()));
                },
              ),
              CoursesButtons(
                label: "Biopsy",
                color: Color(0xFF98D1D4),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: EvaluationFormInfo()));
                },
              ),
              //تكملة الفورم من الداتا بيس
              Container(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Icon(
                        Icons.circle,
                        color: Color(0xFF98D1D4),
                        size: 15,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Accomplished form",
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 15,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Unaccomplished form",
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
