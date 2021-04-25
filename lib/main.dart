import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/AcademicStaff/CourseAS.dart';
import 'package:tester/Screens/AcademicStaff/EvaluationFormsAS.dart';
import 'package:tester/Screens/AcademicStaff/formsAS.dart';

//Pages
import 'package:tester/Screens/AcademicStaff/homePageAS.dart';
import 'package:tester/Screens/Administrator/CourseAdmin.dart';
import 'package:tester/Screens/Administrator/EFAdmin.dart';
import 'package:tester/Screens/Administrator/R.dart';
import 'package:tester/Screens/Administrator/Requests.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/Student/FormPageStudent.dart';
import 'package:tester/Screens/Student/QRCodePageStudent.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';
import 'package:tester/Screens/model/User.dart';
import 'package:tester/Screens/model/evaluationforms/OMR512.dart';
import 'package:tester/Screens/profile.dart';
import 'package:tester/Screens/signUp.dart';
import 'Screens/ResetPass.dart';
import 'Screens/SignIn.dart';
import 'package:tester/Screens/SignIn.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FormsAS(),
    );
  }
}
