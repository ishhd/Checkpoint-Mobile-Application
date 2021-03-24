import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tester/Screens/AcademicStaff/homePageAS.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';

class User {
  String uid;
  final CollectionReference Student = Firestore.instance.collection('Student');
  final CollectionReference AcademicStaff =
      Firestore.instance.collection('AcademicStaff');
  final CollectionReference UserNew = Firestore.instance.collection('User');
  User({this.uid});
  /*Future<void> NewUser(
      String email, String password, String name, String id, String uid) async {
    return await ref.document(uid).setData(
        {'email': email, 'password': password, 'name': name, 'id': id});
  }*/

  Future<void> NewStudent(String email, String password, String name, String id,
      String uid, int activate, String position) async {
    await UserNew.document(uid).setData(({
      'email': email,
      'password': password,
      'name': name,
      'id': id,
      'activate': 0,
      'position': position
    }));
    return await Student.document(uid).setData(({
      'email': email,
      'password': password,
      'name': name,
      'id': id,
      'activate': 0,
      'position': position
    }));
  }

  Future<void> NewAcademicStaff(String email, String password, String name,
      String id, String uid, int activate, String position) async {
    await UserNew.document(uid).setData(({
      'email': email,
      'password': password,
      'name': name,
      'id': id,
      'activate': 0,
      'position': position
    }));
    return await AcademicStaff.document(uid).setData({
      'email': email,
      'password': password,
      'name': name,
      'id': id,
      'activate': 0,
      'position': position
    });
  }

  Future AuthPage(String uid) async {
    try {
      Firestore.instance.collection('User').document(uid).get().then((value) {
        var userType = (value.data)['position'];
        if (userType == '  Academic Staff') {
          runApp(homepageAS());
        } else if (userType == '  Student') {
          runApp(HomePageStudent());
        } else if (userType == 'Admin') {
          runApp(homePageAdministrator());
        }
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
}
