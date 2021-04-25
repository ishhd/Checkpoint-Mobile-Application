import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tester/Screens/Administrator/CourseAdmin.dart';

class UpdateCourses {
  // ignore: non_constant_identifier_names
  Future EditCoursDB(
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
      String labNo,
      String clinicNo) async {
    try {
      await Firestore.instance.collection('courses').document(uid).updateData({
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
