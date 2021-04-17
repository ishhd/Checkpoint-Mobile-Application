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
  var vv = [];
  final CollectionReference Student = Firestore.instance.collection('student');
  final CollectionReference AcademicStaff =
      Firestore.instance.collection('academicStaff');
  final CollectionReference UserNew = Firestore.instance.collection('user');
  final CollectionReference evaluationForm1 =
      Firestore.instance.collection('omr312 PreClinc');

  User({this.uid, this.name, this.id, this.activate});
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
    await evaluationForm1.document(uid).setData(({
          'OMR312': 'OMR312',
          'Punctuality': 0,
          'Appropriate attire as described in ‘Critical PPM’': 0,
          'Proper bench cleanliness': 0,
          'Ability to assess success of anesthesia': 0,
          'Anatomy & injection procedure': 0,
          'Needle insertion point': 0,
          'Operator & Manikin positions': 0,
          'Preparation of armamentarium': 0,
          'Syringe assembly for injection and aspiration': 0,
          'Identification soft and hard tissue landmarks': 0,
          'Student is defensive': 0,
          'Student is receptive	to	 feedback': 0,
          'Above Expectation': 0,
          'Competent': 0,
          'Needs improvement': 0,
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
      Firestore.instance.collection('user').document(uiid).get().then((value) {
        var userType = (value.data)['position'];
        var activate = (value.data)['activate'];
        if (userType == '  Academic Staff' && activate == 1) {
          runApp(HomeScreen(widget: homepageAS()));
        } else if (userType == '  Student' && activate == 1) {
          runApp(HomeScreen(widget: HomePageStudent()));
        } else if (userType == 'Admin') {
          runApp(HomeScreen(widget: homePageAdministrator()));
        }
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Bar(String uid) async {
   

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
