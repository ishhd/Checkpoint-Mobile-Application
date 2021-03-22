import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tester/Screens/Administrator/Requests.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/Sidebar/sidebar_layout.dart';
import 'dart:io' show Platform;
import 'dart:async';

import 'package:tester/Screens/SignIn.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';
import 'package:tester/Screens/model/student.dart';
import 'package:tester/Screens/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Student>.value(
      value: AuthService().user,
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SignIn()),
    );
  }
}
