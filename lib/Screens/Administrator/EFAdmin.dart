import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/Sidebar/sidebar_layout.dart';
import 'package:tester/Screens/style.dart';

class EFAdmin extends StatefulWidget {
  State<StatefulWidget> createState() {
    return EFAdminState();
  }
}

class EFAdminState extends State<EFAdmin> {
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
              "Evaluation Forms",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF525151),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                runApp(homePageAdministrator());
              },
              color: Color(0xFF525151),
              iconSize: 20,
              padding: EdgeInsets.only(left: 20),
            ),
          ),
          body: ListView(
            children: [
              Align(alignment: Alignment.center),
              SizedBox(height: 40),
              CoursesButtons(
                label: "Infiltration",
                color: Color(0xFF98D1D4),
                onpressed: () {
                  runApp(EvaluationFormInfo());
                },
              ),
              CoursesButtons(
                label: "INAB",
                color: Color(0xFF98D1D4),
                onpressed: () {
                  runApp(EvaluationFormInfo());
                },
              ),
              CoursesButtons(
                label: "Suturing",
                color: Color(0xFF98D1D4),
                onpressed: () {
                  runApp(EvaluationFormInfo());
                },
              ),
              CoursesButtons(
                label: "Biopsy",
                color: Color(0xFF98D1D4),
                onpressed: () {
                  runApp(EvaluationFormInfo());
                },
              ),

              //تكملة الفورم من الداتا بيس

              SizedBox(
                height: 20,
              ),
              //SubmitButtons(text: "Add New Evaluation Form", onpressed: () {}),
            ],
          ),
        ));
  }
}

class EvaluationFormInfo extends StatefulWidget {
  State<StatefulWidget> createState() {
    return EvaluationFormInfoState();
  }
}

class EvaluationFormInfoState extends State<EvaluationFormInfo> {
  int group1 = -1;
  int group2 = -1;
  int group3 = -1;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFD9D9D9),
            title: Text(
              "Evaluation Forms",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF525151),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                runApp(EFAdmin());
              },
              color: Color(0xFF525151),
              iconSize: 20,
              padding: EdgeInsets.only(left: 20),
            ),
          ),
          drawer: SideBarLayout(),
          body: Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: GestureDetector(
              onTap: () {},
              child: ListView(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          child: Text(
                            "Name of the form",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF98D1D4),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  questionType(1, "Punctuality"),
                  questionType(
                      2, "Appropriate attire as described in Critical PPM"),
                  questionType(2, "Proper bench cleanliness"),
                  questionType(3,
                      "Benches & instrument cleanliness and waste disposals"),
                  questionType(4, "Feedback"),
                  SizedBox(
                    height: 35,
                  ),
                  SubmitButtons(
                    text: "Save",
                    onpressed: () {},
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget questionType(int questiontype, String question) {
    String questionStr = question;
    int questiontypeint = questiontype;

    switch (questiontypeint) {
      case 1:
        {
          return Container(
              child: Stack(children: [
            SizedBox(
              height: 15,
            ),
            Text(
              questionStr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: group1,
                      onChanged: (T) {
                        setState(() {
                          group1 = T;
                        });
                      },
                    ),
                    Text("Satisfactory"),
                    SizedBox(
                      width: 5,
                    ),
                    Radio(
                      value: 2,
                      groupValue: group1,
                      onChanged: (T) {
                        setState(() {
                          group1 = T;
                        });
                      },
                    ),
                    Text(
                      "Needs Improvement",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ]));
        }
        break;
      case 2:
        {
          return Container(
              child: Stack(children: [
            SizedBox(
              height: 15,
            ),
            Text(
              questionStr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: group2,
                      onChanged: (T) {
                        setState(() {
                          group2 = T;
                        });
                      },
                    ),
                    Text("Satisfactory"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ]));
        }
        break;
      case 3:
        {
          return Container(
              child: Stack(children: [
            SizedBox(
              height: 15,
            ),
            Text(
              questionStr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: group3,
                      onChanged: (T) {
                        setState(() {
                          group3 = T;
                        });
                      },
                    ),
                    Text("Satisfactory"),
                    SizedBox(
                      width: 5,
                    ),
                    Radio(
                      value: 2,
                      groupValue: group3,
                      onChanged: (T) {
                        setState(() {
                          group3 = T;
                        });
                      },
                    ),
                    Text("Needs Improvement"),
                    SizedBox(
                      width: 5,
                    ),
                    Radio(
                      value: 3,
                      groupValue: group3,
                      onChanged: (T) {
                        setState(() {
                          group3 = T;
                        });
                      },
                    ),
                    Text("NA/NO"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ]));
        }
        break;
      case 4:
        {
          return Container(
              child: Stack(children: [
            SizedBox(
              height: 15,
            ),
            Text(
              questionStr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:
                        "Please use this space to record areas strength or any suggestions for development",
                    border: OutlineInputBorder()),
              ),
            )
          ]));
        }
        break;
    }
  }
}
