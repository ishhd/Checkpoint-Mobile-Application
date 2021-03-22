import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/AcademicStaff/formsAS.dart';
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
              SubmitButtons(text: "Add New Evaluation Form", onpressed: () {}),
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
              onTap: () {
                //FocusScope.of(context).unfocus();
              },
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
                  buildTextField("Course code", "OMR 312"),
                  buildTextField("Course name", "Pain Control"),
                  buildTextField("Year", "3"),
                  buildTextField("Semester", "One year (1st/2nd)"),
                  buildTextField("Crediet hours", ""),
                  buildTextField("Practical", "1st Semester: Phantom Lab"),
                  buildTextField("Evaluation form MPE",
                      "Infiltration \(preclinical\)\nInferior alveolar Nerve Block \(IANB\)\(preclinical\)"),
                  buildTextField("No.", "2"),
                  buildTextField("Exam form CE",
                      "Preclinical Exam Infiltration\nPreclinical Exam IANB"),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                      ),
                      SubmitButtons(
                        text: "Save",
                        onpressed: () {},
                      ),
                      SubmitButtons(
                        text: "Delete this form",
                        onpressed: () {},
                      ),
                    ],
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

  Widget buildTextField(String labelText, String placeholder) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
