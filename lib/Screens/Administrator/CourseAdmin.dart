import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/CourseInfo.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/model/Courses.dart';

import '../style.dart';

class CourseAdmin extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CourseAdminState();
  }
}

class CourseAdminState extends State<CourseAdmin> {
  // This widget is the root of your application.

  final _formkey = GlobalKey<FormState>();
  var n;
  Future getCourse(String uid) async {
    n = coursRef.document(uid).documentID;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFD9D9D9),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  runApp(HomeScreen(widget: homePageAdministrator()));
                },
                color: Color(0xFF525151),
                iconSize: 20,
                padding: EdgeInsets.only(left: 20),
              ),
              title: Text(
                "Courses",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF525151),
                ),
              ),
              centerTitle: true,
            ),
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
                  getCourse('zm1261MMkeUHoycCou73');
                  if (n != null) {
                    runApp(MaterialApp(
                        debugShowCheckedModeBanner: false,
                        home: CourseInfo(
                          uid: '1TE8kE3GYaxKtJsFgSdR',
                        )));
                  } else {
                    DeletPage();
                  }
                },
              ),
              CoursesButtons(
                label: "OMR 511",
                color: Color(0xFFC697F6),
                onpressed: () {
                  getCourse('zm1261MMkeUHoycCou73');
                  if (n != null) {
                    runApp(MaterialApp(
                        debugShowCheckedModeBanner: false,
                        home: CourseInfo(
                          uid: 'zm1261MMkeUHoycCou73',
                        )));
                  } else {
                    DeletPage();
                  }
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
                      debugShowCheckedModeBanner: false,
                      home: CourseInfo(uid: '2IJMCEPsz6rUv1GtHi2q')));
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

  AddCourseButton(String name, String uid) {
    CoursesButtons(
      label: name,
      color: Color(0xFFF6CAAC),
      onpressed: () {
        runApp(MaterialApp(
            debugShowCheckedModeBanner: false, home: CourseInfo(uid: uid)));
      },
    );
  }
}
