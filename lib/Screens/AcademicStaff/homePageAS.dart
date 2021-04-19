import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/AcademicStaff/CourseAS.dart';
import 'package:tester/Screens/AcademicStaff/EvaluationFormsAS.dart';
import 'package:tester/Screens/AcademicStaff/ReportAS.dart';
import 'package:tester/Screens/AcademicStaff/ScanQR.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/style.dart';
import 'package:url_launcher/url_launcher.dart';

class homepageAS extends StatefulWidget {
  State<StatefulWidget> createState() {
    return homepageASState();
  }
}

class homepageASState extends State<homepageAS> {
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFFD9D9D9),
            title: Text(
              "OMR 312",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF525151),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                runApp(HomeScreen(widget: CourseAS()));
              },
              color: Color(0xFF525151),
              iconSize: 20,
              padding: EdgeInsets.only(left: 20),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(alignment: Alignment.center),
              MenuButtons(
                label: "Register Attendance",
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false, home: ScanQR()));
                },
              ),
              MenuButtons(
                label: "Evaluation Forms",
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: EvaluationFormsAS()));
                },
              ),
              MenuButtons(
                label: "Courses Report",
                onpressed: () async {
                  const url =
                      "https://docs.google.com/spreadsheets/d/1dW6QVkpNbP7shsWW4OKKIw2LD4Dw_9JRNAScTLyZ4lw/edit#gid=0";
                  if (await canLaunch(url))
                    await launch(url);
                  else
                    await launch(url, forceWebView: true);
                },
              )
            ],
          ),
        ));
  }
}
