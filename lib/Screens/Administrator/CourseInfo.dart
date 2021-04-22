import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/CourseAdmin.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:tester/Screens/model/Courses.dart';
import 'package:tester/Screens/style.dart';

final coursRef = Firestore.instance.collection('courses');

class CourseInfo extends StatefulWidget with NavigationStates {
  final String uid;
  const CourseInfo({this.uid});
  @override
  _CourseInfoState createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
   String courseCode = '';
  String courseName = "";
  String credietHours = '';
  String evaluationFormMPE = "";
  String examFormCE = "";
  String practical = "";
  String no = "";
  String semester = "";
  String year = "";

  Future getCourse() async {
    final DocumentSnapshot doc =
        // ignore: missing_return
        await coursRef.document(widget.uid).get().then((value) {
      courseCode = (value.data)['courseCode'];
      courseName = (value.data)['courseName'];
      credietHours = (value.data)['credietHours'];
      examFormCE = (value.data)['examFormCE'];
      practical = (value.data)['practical'];
      no = (value.data)['no'];
      semester = (value.data)['semester'];
      year = (value.data)['year'];
      evaluationFormMPE = (value.data)['evaluationFormMPE'];
    });
    //name = doc.data as String;
  }

  /*String courseCode = 'OMR 312';
  String courseName = "Pain Control";
  String credietHours = '';
  String evaluationFormMPE =
      "Infiltration \(preclinical\)\nInferior alveolar Nerve Block \(IANB\)\(preclinical\)";
  String examFormCE = "Preclinical Exam Infiltration\nPreclinical Exam IANB";
  String practical = "1st Semester: Phantom Lab";
  String no = "2";
  String semester = "One year (1st/2nd)";
  String year = "3";*/

 
  @override
  Widget build(BuildContext context) {
    getCourse();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFD9D9D9),
            title: Text(
              "Courses",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF525151),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                runApp(CourseAdmin());
              },
              color: Color(0xFF525151),
              iconSize: 20,
              padding: EdgeInsets.only(left: 20),
            ),
          ),
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
                            courseCode,
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
                  buildTextField("Course code", courseCode),
                  buildTextField("Course name", courseName),
                  buildTextField("Year", year),
                  buildTextField("Semester", semester),
                  buildTextField("Crediet hours", credietHours),
                  buildTextField("Practical", practical),
                  buildTextField("Evaluation form MPE", evaluationFormMPE),
                  buildTextField("No.", no),
                  buildTextField("Exam form CE", examFormCE),
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
                        onpressed: () {
                          UpdateCourses().EditCoursDB(
                              widget.uid,
                              courseCode,
                              courseName,
                              credietHours,
                              evaluationFormMPE,
                              examFormCE,
                              practical,
                              no,
                              semester,
                              year);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Save the course"),
                                content:
                                    new Text("Do you want to save this edit?"),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Yes"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      UpdateCourseInfo();
                                    },
                                  ),
                                  new FlatButton(
                                    child: new Text("No"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      SubmitButtons(
                        text: "Delete this course",
                        onpressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Delete the course"),
                                content: new Text(
                                    "Are you sure you want to delete this course?"),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Yes, Delete"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Deletcourse(widget.uid);
                                    },
                                  ),
                                  new FlatButton(
                                    child: new Text("No"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
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

  UpdateCourseInfo() {
    UpdateCourses().EditCoursDB(
        widget.uid,
        courseCode,
        courseName,
        credietHours,
        evaluationFormMPE,
        examFormCE,
        practical,
        no,
        semester,
        year);
  }

  Widget submitButtons({Null Function() onpressed, String text}) {
    return Container(
        width: 150,
        height: 40,
        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
        alignment: Alignment.center,
        child: RaisedButton(
            color: Color(0xFF98D1D4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            onPressed: onpressed));
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        onChanged: (val) {
          setState(() => placeholder = val);
          if (labelText == "Course code") {
            courseCode = placeholder;
          }
          if (labelText == "Course name") {
            courseName = placeholder;
          }
          if (labelText == "Year") {
            year = placeholder;
          }
          if (labelText == "Semester") {
            semester = placeholder;
          }
          if (labelText == "Crediet hours") {
            credietHours = placeholder;
          }
          if (labelText == "Practical") {
            practical = placeholder;
          }
          if (labelText == "Evaluation form MPE") {
            evaluationFormMPE = placeholder;
          }
          if (labelText == "No.") {
            no = placeholder;
          }
          if (labelText == "Exam form CE") {
            examFormCE = placeholder;
          }
        },
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

class NewCourse extends StatefulWidget with NavigationStates {
  @override
  _NewCourseState createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  String courseCode = '';
  String courseName = '';
  String credietHours = '';
  String evaluationFormMPE = '';
  String examFormCE = '';
  String practical = ' ';
  String no = ' ';
  String semester = ' ';
  String year = ' ';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFD9D9D9),
            title: Text(
              "Add new course",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF525151),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                runApp(HomeScreen(widget: CourseAdmin()));
              },
              color: Color(0xFF525151),
              iconSize: 20,
              padding: EdgeInsets.only(left: 20),
            ),
          ),
          body: newCourse(),
        ));
  }

  Widget newCourse() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: GestureDetector(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            buildTextField("Course code", courseCode),
            buildTextField("Course name", courseName),
            buildTextField("Year", year),
            buildTextField("Semester", semester),
            buildTextField("Crediet hours", credietHours),
            buildTextField("Practical", practical),
            buildTextField("Evaluation form MPE", evaluationFormMPE),
            buildTextField("No.", no),
            buildTextField("Exam form CE", examFormCE),
            SizedBox(
              height: 35,
            ),
            SubmitButtons(
              text: "Save",
              onpressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("Add new course"),
                      content:
                          new Text("Are you sure you want to add this course?"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Yes"),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await AddCourse().NewCourseDB(
                                courseCode,
                                courseName,
                                credietHours,
                                evaluationFormMPE,
                                examFormCE,
                                practical,
                                no,
                                semester,
                                year);
                          },
                        ),
                        new FlatButton(
                          child: new Text("No"),
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        onChanged: (val) {
          setState(() => placeholder = val);
          if (labelText == "Course code") {
            courseCode = placeholder;
          }
          if (labelText == "Course name") {
            courseName = placeholder;
          }
          if (labelText == "Year") {
            year = placeholder;
          }
          if (labelText == "Semester") {
            semester = placeholder;
          }
          if (labelText == "Crediet hours") {
            credietHours = placeholder;
          }
          if (labelText == "Practical") {
            practical = placeholder;
          }
          if (labelText == "Evaluation form MPE") {
            evaluationFormMPE = placeholder;
          }
          if (labelText == "No.") {
            no = placeholder;
          }
          if (labelText == "Exam form CE") {
            examFormCE = placeholder;
          }
        },
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
