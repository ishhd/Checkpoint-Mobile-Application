import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/CourseAdmin.dart';
import 'package:tester/Screens/Administrator/EFAdmin.dart';
import 'package:tester/Screens/Sidebar/sidebar_layout.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:tester/Screens/services/auth.dart';
import 'package:tester/Screens/style.dart';

class homePageAdministrator extends StatefulWidget with NavigationStates {
  State<StatefulWidget> createState() {
    return homePageAdministratorState();
  }
}

class homePageAdministratorState extends State<homePageAdministrator> {
  final AuthService _auth = AuthService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          drawerEnableOpenDragGesture: true,
          drawer: SideBarLayout(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: ListView(children: [
            Align(alignment: Alignment.center),
            Container(
              margin: EdgeInsets.only(bottom: 70),
              child: Image.asset(
                'Assets/CheckpointOpacity.png',
                height: 100,
              ),
            ),
            MenuButtons(
              label: "Courses",
              onpressed: () {
                runApp(CourseAdmin());
              },
            ),
            MenuButtons(
              label: "Evaluation Forms",
              onpressed: () {
                runApp(EFAdmin());
              },
            ),
            MenuButtons(
              label: "Schedules",
              onpressed: () async {
                _auth.RequstsActivate();
              },
            ),
          ])),
    );
  }
}
