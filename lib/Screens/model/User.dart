import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tester/Screens/AcademicStaff/homePageAS.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';

class User {
  String error = '';
  String uid;
  String name;
  String id;
  String activate;
  String state;
  var vv = [];
  final CollectionReference Student = Firestore.instance.collection('student');
  final CollectionReference AcademicStaff =
      Firestore.instance.collection('academicStaff');
  final CollectionReference UserNew = Firestore.instance.collection('user');
  final CollectionReference Attendance =
      Firestore.instance.collection('attendance');
  final CollectionReference Delay = Firestore.instance.collection('Delay');

  final CollectionReference evaluationForm1 =
      Firestore.instance.collection('omr312PreClinc');

  User({this.uid, this.name, this.id, this.activate});
  /*Future<void> NewUser(
      String email, String password, String name, String id, String uid) async {
    return await ref.document(uid).setData(
        {'email': email, 'password': password, 'name': name, 'id': id});
  }*/

  Future<void> NewStudent(String email, String password, String name, String id,
      String uid, int activate, String position) async {
    await Attendance.document(uid).setData(({
      'Name': 0,
      'Absent': 0,
    }));
    await Delay.document(uid).setData(({
      'Name': 0,
      'Delayed': 0,
    }));
    await UserNew.document(uid).setData(({
      'email': email,
      'password': password,
      'name': name,
      'id': id,
      'activate': 0,
      'position': position
    }));
    await evaluationForm1.document(uid).setData(({
          'courseName': 'OMR312',
          'punctuality': 'Null',
          'appropriate attire as described in ‘Critical PPM’': 'Null',
          'proper bench cleanliness': 'Null',
          'tray organization': 'Null',
          'understanding the indications, relevant anatomy, material selection, technique of procedure':
              'Null',
          'with Staff': 'Null',
          'benches & instrument cleanliness and waste disposals': 'Null',
          'adherence to school’s ‘Code of Professional Conduct’': 'Null',
          'feedback': 'Null',
          'preparation of armamentarium / Self Assessment': 'Null',
          'syringe assembly for injection and aspiration / Self Assessment':
              'Null',
          'operator & Manikin positions / Self Assessment': 'Null',
          'identification soft and hard tissue landmarks / Self Assessment':
              'Null',
          'needle insertion point / Self Assessment': 'Null',
          'anatomy & injection procedure / Self Assessment': 'Null',
          'ability to assess success of anesthesia / Self Assessment': 'Null',
          'preparation of armamentarium / Instructor Evaluation': 'Null',
          'syringe assembly for injection and aspiration / Instructor Evaluation':
              'Null',
          'operator & Manikin positions / Instructor Evaluation': 'Null',
          'identification soft and hard tissue landmarks / Instructor Evaluation':
              'Null',
          'needle insertion point / Instructor Evaluation': 'Null',
          'anatomy & injection procedure / Instructor Evaluation': 'Null',
          'ability to assess success of anesthesia / Instructor Evaluation':
              'Null',
          'student’s overall ability to perform the protective': 'Null',
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

  // ignore: non_constant_identifier_names
  Future<void> NewAdmin(
      String email, String password, String name, String id, String uid) async {
    await UserNew.document(uid).setData(({
      'email': email,
      'password': password,
      'name': name,
      'id': id,
      'activate': 1,
      'position': 'Admin'
    }));
  }

  // ignore: non_constant_identifier_names
  Future AuthPage(String uiid) async {
    try {
      uid = uiid;
      await Firestore.instance
          .collection('user')
          .document(uiid)
          .get()
          .then((value) {
        var userType = (value.data)['position'];
        var activate = (value.data)['activate'];
        if (userType == '  Academic Staff' && activate == 1) {
          runApp(HomeScreen(widget: homepageAS()));
        } else if (userType == '  Student' && activate == 1) {
          runApp(HomeScreen(widget: HomePageStudent()));
        } else if (userType == 'Admin') {
          runApp(HomeScreen(widget: homePageAdministrator()));
        } else if (activate == 0) {
          state = '1';
        }
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future status() async {
    state = 'Your acccount into hold';
    return state;
  }

// Change the active to 1
  // ignore: non_constant_identifier_names
  Future Activate(String uid) async {
    try {
      Firestore.instance
          .collection('user')
          .document(uid)
          .updateData({'activate': 1});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Stream<QuerySnapshot> get ActUser {
  //  return UserNew.snapshots();
  //}

// print user for activate
  Future PrintUs() async {
    Firestore.instance.collection('user').document(uid).get().then((value) {
      var Name = (value.data)['name'];
      var id = (value.data)['id'];
      var Activ = (value.data)['activate'];
      if (Activ == 0) {
        for (var i in vv) {
          print(Name && id);
        }
      } else {
        return 'There is no one';
      }
    });
  }

  /*List<User> _userList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return User(
          name: doc.data['name'] ?? ' ',
          id: doc.data[id] ?? '',
          activate: doc.data['activate']);
    }).toList();
  }*/

  /* Stream<List<User>> get user {
    Firestore.instance.collection('user').document(uid).get().then((value) {
      var activate = (value.data)['activate'];
      if (activate == 0) {
    return UserNew.snapshots().map(_userList);
  }*/

  // ignore: non_constant_identifier_names
  Future<void> UpdateAdmin(
    String name,
    String id,
  ) async {
    await Firestore.instance
        .collection('user')
        .document('4L4GSLTUJvPjZGiM8sN4JXh0qOt2')
        .updateData({
      'name': name,
      'id': id,
    });
  }
}
