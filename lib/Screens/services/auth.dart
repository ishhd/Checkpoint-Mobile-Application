import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:tester/Screens/Administrator/AddAdmin.dart';
import 'package:tester/Screens/Sidebar/sidebar.dart';
import 'package:tester/Screens/SignIn.dart';
import 'package:tester/Screens/model/QRcode.dart';
import 'package:tester/Screens/model/User.dart';
import 'package:tester/Screens/profile.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //creat user object
  User _userFromFire(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future getCurrent() async {
    FirebaseUser result = (await _auth.currentUser());
    return result.uid;
    //  String uid = user.uid;
    // return uid;
    //return currentUser.uid;
    //return (await _auth.currentUser()).uid;
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFire(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> resetPassword(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  //Sign in
  // ignore: non_constant_identifier_names
  Future SignInProcess(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //await Profile(
      // uid: user.uid,
      //);
      await User().AuthPage(user.uid);

      //return _userFromFire(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register With email and password
  Future registerProcessStudent(String email, String password, String name,
      String id, String position, int activate
      //String name,
      //String id,
      ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await User().NewStudent(email, password, name, id, user.uid, 0, position);
      await UserManagement().storeNewUser(user, context, name);
      runApp(SignIn());
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerProcessAcademicStaff(String email, String password,
      String name, String id, String position, int activate
      //String name,
      //String id,
      ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await User()
          .NewAcademicStaff(email, password, name, id, user.uid, 0, position);
      runApp(SignIn());
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // ignore: non_constant_identifier_names
  Future AddNewAdmin(
    String email,
    String password,
    String name,
    String id,
  ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await User().NewAdmin(email, password, name, id, user.uid);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future prof() {
    FirebaseUser user;
    // runApp(Profile(uid: user.uid));
  }

  // get the information
  Future RequstsActivate() async {
    try {
      await User().PrintUs();
      return;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // send Active id
  Future ActivateSt() async {
    try {
      FirebaseUser user;
      await User().Activate(user.uid);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
