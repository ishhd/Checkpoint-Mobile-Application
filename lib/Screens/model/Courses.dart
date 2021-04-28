import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tester/Screens/Administrator/CourseAdmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/AcademicStaff/formsAS.dart';
import 'package:tester/Screens/Administrator/CourseInfo.dart';
import 'package:tester/Screens/Administrator/EFAdmin.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/Student/CoursePageStudent.dart';
import 'package:tester/Screens/Student/FormPageStudent.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';
import 'package:tester/Screens/style.dart';

class UpdateCourses {
  final CollectionReference Course = Firestore.instance.collection('courses');
  // ignore: non_constant_identifier_names
 Future<void> EditCoursDB(
    String uid,
    String courseCode,
    String courseName,
    String credietHours,
    String evaluationFormMPE,
    String examFormCE,
    String practical,
    String no,
    String semester,
    String year,
    String clinicNo,
    String labNo,
  ) async {
    try {
      await Course.document(uid).updateData({
        'courseCode': courseCode,
        'courseName': courseName,
        'credietHours': credietHours,
        'evaluationFormMPE': evaluationFormMPE,
        'examFormCE': examFormCE,
        'practical': practical,
        'no': no,
        'semester': semester,
        'year': year,
        'clinicNo': clinicNo,
        'labNo': labNo
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future<void> EditCoursCode(
    String uid,
    String courseCode,
  ) async {
    try {
      await Course.document(uid).updateData({'courseCode': courseCode});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> EditCoursName(
    String uid,
    String courseName,
  ) async {
    try {
      await Course.document(uid).updateData({
        'courseName': courseName,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class AddCourse {
  String uid;
  final CollectionReference Course = Firestore.instance.collection('courses');
  Future<void> NewCourseDB(
      String courseCode,
      String courseName,
      String credietHours,
      String evaluationFormMPE,
      String examFormCE,
      String practical,
      String no,
      String semester,
      String year,
      String labNo,
      String clinicNo) async {
    await Course.document(uid).setData(({
      'courseCode': courseCode,
      'courseName': courseName,
      'credietHours': credietHours,
      'evaluationFormMPE': evaluationFormMPE,
      'examFormCE': examFormCE,
      'practical': practical,
      'no': no,
      'semester': semester,
      'year': year,
      'clinicNo': clinicNo,
      'labNo': labNo
    }));
  }
}

class Deletcourse {
  Deletcourse(String uid) {
    try {
      Firestore.instance.collection('courses').document(uid).delete();
      runApp(CourseAdmin());
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}

class DeletPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CoursStudentState();
  }
}

class DeletPagetState extends State<DeletPage> {
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
                'courseCode',
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
                  "The Course is Deleted ",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.center,
              ),
            ])));
  }
}
