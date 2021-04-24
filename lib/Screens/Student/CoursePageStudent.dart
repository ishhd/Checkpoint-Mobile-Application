import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/AcademicStaff/formsAS.dart';
import 'package:tester/Screens/Administrator/CourseInfo.dart';
import 'package:tester/Screens/Administrator/EFAdmin.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/Student/FormPageStudent.dart';
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
            appBar: AppBar(
              backgroundColor: Color(0xFFD9D9D9),
              title: Text(
                "Courses",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF525151),
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  runApp(HomeScreen(widget: HomePageStudent()));
                },
                color: Color(0xFF525151),
                iconSize: 20,
                padding: EdgeInsets.only(left: 20),
              ),
            ),
            backgroundColor: Colors.white,
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
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: CoursStudent(uid: '1TE8kE3GYaxKtJsFgSdR')));
                },
              ),
              CoursesButtons(
                label: "OMR 511",
                color: Color(0xFFC697F6),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false, home: CoursStudent()));
                },
              ),
              CoursesButtons(
                label: "OMR 611",
                color: Color(0xFFB4C6E7),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false, home: CoursStudent()));
                },
              ),
              CoursesButtons(
                label: "SURD 401",
                color: Color(0xFFF6CAAC),
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false, home: CoursStudent()));
                },
              ),
            ])));
  }
}

class CoursStudent extends StatefulWidget {
  final String uid;
  const CoursStudent({this.uid});
  State<StatefulWidget> createState() {
    return CoursStudentState();
  }
}

class CoursStudentState extends State<CoursStudent> {
  String labNo = '';
  String clinicNo = '';
  String courseCode = '';
  Future getCourse() async {
    final DocumentSnapshot doc =
        // ignore: missing_return
        await coursRef.document(widget.uid).get().then((value) {
      courseCode = (value.data)['courseCode'];
      labNo = (value.data)['labNo'];
      clinicNo = (value.data)['clinicNo'];
    });
    //name = doc.data as String;
  }

  @override
  Widget build(BuildContext context) {
    getCourse();
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
                courseCode,
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
                  "Lab No.   " + labNo,
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
                  "Clinc No.   " + clinicNo,
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
<<<<<<< HEAD
                  runApp(EvaluationFormsStudent());
||||||| e77be50
                  runApp(EvaluationFormInfo());
=======
                  runApp(FormPageStudent());
>>>>>>> d2e464e6606c6b2ed2d7715061a95d5cf516e788
                },
              ),
            ])));
  }
}
