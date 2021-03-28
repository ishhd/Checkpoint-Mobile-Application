import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/EFAdmin.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';
import 'package:tester/Screens/style.dart';

class CoursPageStudent extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CoursPageStudentState();
  }
}

class CoursPageStudentState extends State<CoursPageStudent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                "Courses",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF525151),
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  runApp(HomePageStudent());
                },
                color: Color(0xFF525151),
                iconSize: 20,
                padding: EdgeInsets.only(left: 20),
              ),
            ),
            body: ListView(children: [
              Align(
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 60,
              ),
              CoursesButtons(
                label: "OMR 312",
                color: Color(0xFF92D050),
                onpressed: () {
                  runApp(CoursStudent());
                },
              ),
              CoursesButtons(
                label: "OMR 511",
                color: Color(0xFFC697F6),
                onpressed: () {
                  runApp(CoursStudent());
                },
              ),
              CoursesButtons(
                label: "OMR 611",
                color: Color(0xFFB4C6E7),
                onpressed: () {
                  runApp(CoursStudent());
                },
              ),
              CoursesButtons(
                label: "SURD 401",
                color: Color(0xFFF6CAAC),
                onpressed: () {
                  runApp(CoursStudent());
                },
              ),
            ])));
  }
}

class CoursStudent extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CoursStudentState();
  }
}

class CoursStudentState extends State<CoursStudent> {
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
                "Name of the course#",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF525151),
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  runApp(CoursPageStudent());
                },
                color: Color(0xFF525151),
                iconSize: 20,
                padding: EdgeInsets.only(left: 20),
              ),
            ),
            body: ListView(children: [
              Align(
                alignment: Alignment.center,
              ),
              SizedBox(height: 50),
              Container(
                child: Text(
                  "Lab No.  ## ",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  "Clinc No.  ## ",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 50),
              MenuButtons(
                label: "View Forms",
                onpressed: () {
                  runApp(EvaluationFormInfo());
                },
              ),
            ])));
  }
}
