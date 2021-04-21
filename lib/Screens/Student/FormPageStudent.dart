import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/AcademicStaff/EvaluationFormsAS.dart';
import 'package:tester/Screens/Administrator/AddAdmin.dart';
import 'package:tester/Screens/model/evaluationforms/OMR512.dart';

final EFRef = Firestore.instance.collection('omr312 PreClinc');
String uid = 'NtQTZ2dZp4e8WSZ9J1rYW1ugvyC3';

class FormPageStudent extends StatefulWidget {
  State<StatefulWidget> createState() {
    return FormPageStudentState();
  }
}

class FormPageStudentState extends State<FormPageStudent> {
  String name;
  String id;
  String Q1 = '  Instructor Evaluation';

  getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final DocumentSnapshot doc =
        // ignore: missing_return
        await EFRef.document(user.uid).get().then((value) {
      name = (value.data)['name'];
      id = (value.data)['id'];
    });
    //name = doc.data as String;
  }

  // This widget is the root of your application.
  int group1 = -1;
  int group2 = -1;
  int group3 = -1;
  int group = -1;

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
                runApp(EvaluationFormsAS());
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
                            "Infiltration",
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
                  Text("Section I",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    height: 5,
                  ),
                  questionType(1, "Punctuality", 1),
                  questionType(
                      2, "Appropriate attire as described in Critical PPM", 2),
                  questionType(2, "Proper bench cleanliness", 3),
                  questionType(1, "Tray organization", 4),
                  questionType(
                      1,
                      "Understanding the indications, relevant anatomy, material selection, technique of procedure",
                      5),
                  questionType(1, "With Staff", 6),
                  questionType(
                      3,
                      "Benches & instrument cleanliness and waste disposals",
                      7),
                  questionType(
                      2,
                      "Adherence to school’s ‘Code of Professional Conduct’",
                      8),
                  questionType(4, "Feedback", 9),
                  SizedBox(
                    height: 35,
                  ),
                  Text("Section II",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    height: 5,
                  ),
                  sectionII("Preparation of armamentarium"),
                  sectionII("Syringe assembly for injection and aspiration"),
                  sectionII("Operator & Manikin positions"),
                  sectionII("Identification soft and hard tissue landmarks"),
                  sectionII("Needle insertion point"),
                  sectionII("Anatomy & injection procedure"),
                  sectionII("Ability to assess success of anesthesia"),
                  SizedBox(
                    height: 5,
                  ),
                  sectionIV(
                      "Student’s overall ability to perform the protective"),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget questionType(int questiontype, String question, int questionNumber) {
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
              margin: EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: group1,
                      onChanged: (T) {
                        if (questionNumber == 2) {
                          evaluationform()
                              .Appropriate('07Pgmy307rU1i1SpzQGh053TtTB3', '1');
                        } else if (questionNumber == 3) {
                          evaluationform()
                              .Proper('07Pgmy307rU1i1SpzQGh053TtTB3', '1');
                        } else if (questionNumber == 3) {
                          evaluationform()
                              .Adherence('07Pgmy307rU1i1SpzQGh053TtTB3', '1');
                        }
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
              margin: EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: group2,
                      onChanged: (value) {
                        evaluationform().Appropriate(uid, '1');
                        setState(() {
                          Q1 = value;
                          // group2 = T;
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
              margin: EdgeInsets.only(top: 20),
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
                onChanged: (val) {
                  evaluationform()
                      .feedback('07Pgmy307rU1i1SpzQGh053TtTB3', val);
                },
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

  Widget sectionII(String question) {
    String selfAssessment;
    String instructorEvaluation;

    return Stack(
      children: <Widget>[
        Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Container(
            height: 45,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4)),
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: Text("  Self Assessment"),
              value: selfAssessment,
              validator: (value) =>
                  value.isEmpty ? 'Choose the Position Please' : null,
              onChanged: (value) {
                evaluationform()
                    .feedback('07Pgmy307rU1i1SpzQGh053TtTB3', value);
                setState(() {
                  Q1 = value;
                  selfAssessment = value;
                });
              },
              items: ['  0', '  1', '  2', '  NA'].map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 45,
          margin: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4)),
          child: DropdownButtonFormField(
            isExpanded: true,
            hint: Text("  Instructor Evaluation"),
            value: instructorEvaluation,
            validator: (value) =>
                value.isEmpty ? 'Choose the Position Please' : null,
            onChanged: (value) {
              setState(() {
                instructorEvaluation = value;
              });
            },
            items: ['  0', '  1', '  2', '  NA'].map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 140,
        )
      ],
    );
  }

  Widget sectionIV(String question) {
    return Stack(
      children: [
        Text(
          question,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: group,
                  onChanged: (T) {
                    setState(() {
                      group = T;
                    });
                  },
                ),
                Text("Needs Improvement"),
                SizedBox(
                  width: 5,
                ),
                Radio(
                  value: 2,
                  groupValue: group,
                  onChanged: (T) {
                    setState(() {
                      group = T;
                    });
                  },
                ),
                Text("Competent"),
                SizedBox(
                  width: 5,
                ),
                Radio(
                  value: 3,
                  groupValue: group,
                  onChanged: (T) {
                    setState(() {
                      group = T;
                    });
                  },
                ),
                Text("Above Expectation"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
