import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/SchedulesAdmin.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/Sidebar/sidebar_layout.dart';
import 'package:tester/Screens/Student/AttendancePageStudent.dart';
import 'package:tester/Screens/Student/CoursePageStudent.dart';
import 'package:tester/Screens/Student/QRCodePageStudent.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:tester/Screens/style.dart';

class HomePageStudent extends StatefulWidget with NavigationStates {
  State<StatefulWidget> createState() {
    return HomePageStudentState();
  }
}

class HomePageStudentState extends State<HomePageStudent> {
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
            body: Center(
                child: ListView(
              children: [
                Align(alignment: Alignment.center),
                SizedBox(
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(70, 0, 70, 70),
                    child: Image.asset(
                      'Assets/CheckpointOpacity.png',
                      height: 100,
                    )),
                MenuButtons(
                  label: "Courses",
                  onpressed: () {
                    runApp(HomeScreen(widget: CoursPageStudent()));
                  },
                ),
                MenuButtons(
                  label: "QR Code",
                  onpressed: () {
                    runApp(HomeScreen(
                        widget: MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: QRCodePageStudent())));
                  },
                ),
                MenuButtons(
                  label: "Attendance Report",
                  onpressed: () {
                    runApp(HomeScreen(widget: AttendancePageStudent()));
                  },
                ),
              ],
            ))));
  }
}
