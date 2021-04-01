import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/CourseInfo.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';

import '../style.dart';

class CourseAdmin extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CourseAdminState();
  }
}

class CourseAdminState extends State<CourseAdmin> {
  // This widget is the root of your application.

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            drawerEnableOpenDragGesture: true,
            backgroundColor: Colors.white,
            body: ListView(key: _formkey, children: [
              Align(
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 20,
              ),
              CoursesButtons(
                label: "OMR 312",
                color: Color(0xFF92D050),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false, home: CourseInfo()));
                },
              ),
              CoursesButtons(
                label: "OMR 511",
                color: Color(0xFFC697F6),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false, home: CourseInfo()));
                  // runApp(CourseInfo());
                },
              ),
              CoursesButtons(
                label: "OMR 611",
                color: Color(0xFFB4C6E7),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false, home: CourseInfo()));
                  // runApp(CourseInfo());
                },
              ),
              CoursesButtons(
                label: "SURD 401",
                color: Color(0xFFF6CAAC),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false, home: CourseInfo()));
                  // runApp(CourseInfo());
                },
              ),
              SizedBox(
                height: 20,
              ),
              SubmitButtons(
                  text: "Add Course",
                  onpressed: () {
                    runApp(MaterialApp(
                        debugShowCheckedModeBanner: false, home: NewCourse()));
                  }),
            ])));
  }
}
