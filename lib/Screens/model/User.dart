import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tester/Screens/AcademicStaff/homePageAS.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';

class User {
  String error = '';
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
        var activate = (value.data)['activate'];
        if (userType == '  Academic Staff' && activate == 1) {
          runApp(homepageAS());
        } else if (userType == '  Student' && activate == 1) {
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

// Change the active to 1
  Future Activate(String uid) async {
    try {
      Firestore.instance
          .collection('User')
          .document(uid)
          .updateData({'activate': 1});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<QuerySnapshot> get ActUser {
    return UserNew.snapshots();
  }

// print user for activate
  Future PrintUs() async {
    Firestore.instance.collection('User').document(uid).get().then((value) {
      var Name = (value.data)['name'];
      var id = (value.data)['id'];
      var Activ = (value.data)['activate'];
      if (Activ == 0) {
        print(Name && id);
        return Name && id;
      } else {
        return 'There is no one';
      }
    });
  }
}
