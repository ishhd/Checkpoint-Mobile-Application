import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/AcademicStaff/EvaluationFormsAS.dart';
import 'package:tester/Screens/Administrator/AddAdmin.dart';
import 'package:tester/Screens/model/evaluationforms/OMR512.dart';
import 'package:flutter/material.dart';

final EFRef = Firestore.instance.collection('omr312PreClinc');

class FormPageStudent extends StatefulWidget {
  State<StatefulWidget> createState() {
    return FormPageStudentState();
  }
}

class FormPageStudentState extends State<FormPageStudent> {
  String Ques1;
  String Ques2;
  String Ques3;
  String Ques4;
  String Ques5;
  String Ques6;
  String Ques7;
  String Ques8;
  String Ques9;
  String Ques10;
  String III;

  String n = '  1';
  String m = '  2';
  I() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final DocumentSnapshot doc =
        // ignore: missing_return
        await EFRef.document(user.uid).get().then((value) {
      String Q1 = (value.data)['punctuality'];
      if (Q1 == '1') {
        Ques1 = "Satisfactory";
      } else if (Q1 == '2') {
        Ques1 = "Needs Improvement";
      }
      String Q2 =
          (value.data)['appropriate attire as described in ‘Critical PPM’'];
      if (Q2 == '1') {
        Ques2 = "Satisfactory";
      }
      String Q3 = (value.data)['proper bench cleanliness'];
      if (Q3 == '1') {
        Ques2 = "Satisfactory";
      }
      String Q4 = (value.data)['tray organization'];
      if (Q4 == '1') {
        Ques4 = "Satisfactory";
      } else if (Q4 == '2') {
        Ques4 = "Needs Improvement";
      }
      String Q5 = (value.data)[
          'understanding the indications, relevant anatomy, material selection, technique of procedure'];
      if (Q5 == '1') {
        Ques5 = "Satisfactory";
      } else if (Q5 == '2') {
        Ques5 = "Needs Improvement";
      }
      String Q6 = (value.data)['with Staff'];
      if (Q6 == '1') {
        Ques6 = "Satisfactory";
      } else if (Q6 == '2') {
        Ques6 = "Needs Improvement";
      }
      String Q7 =
          (value.data)['benches & instrument cleanliness and waste disposals'];
      if (Q7 == '1') {
        Ques7 = "Satisfactory";
      } else if (Q7 == '2') {
        Ques7 = "Needs Improvement";
      } else if (Q7 == 'NA/NO') {
        Ques7 = "NA/NO";
      }
      String Q8 =
          (value.data)['adherence to school’s ‘Code of Professional Conduct’'];
      if (Q8 == '1') {
        Ques8 = "Satisfactory";
      }
      String Q9 = (value.data)['feedback'];
      Ques9 = Q9;

      String QIII =
          (value.data)['student’s overall ability to perform the protective'];
      if (QIII == '1') {
        III = "Needs Improvement";
      } else if (QIII == '2') {
        III = "Competent";
      } else if (QIII == '3') {
        III = 'Above Expectation';
      }
    });
  }

  String IIQ1;
  String IIQ2;
  String IIQ3;
  String IIQ4;
  String IIQ5;
  String IIQ6;
  String IIQ7;
  String IIQ8;
  String IIQ9;
  String IIQ10;
  String IIQ11;
  String IIQ12;
  String IIQ13;
  String IIQ14;
  II() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final DocumentSnapshot doc =
        // ignore: missing_return
        await EFRef.document(user.uid).get().then((value) {
      IIQ1 = (value.data)['preparation of armamentarium / Self Assessment'];
      IIQ2 =
          (value.data)['preparation of armamentarium / Instructor Evaluation'];
      IIQ3 = (value.data)[
          'syringe assembly for injection and aspiration / Self Assessment'];
      IIQ4 = (value.data)[
          'syringe assembly for injection and aspiration / Instructor Evaluation'];
      IIQ5 = (value.data)['operator & Manikin positions / Self Assessment'];
      IIQ6 =
          (value.data)['operator & Manikin positions / Instructor Evaluation'];
      IIQ7 = (value.data)[
          'identification soft and hard tissue landmarks / Self Assessment'];
      IIQ8 = (value.data)[
          'identification soft and hard tissue landmarks / Instructor Evaluation'];
      IIQ9 = (value.data)['needle insertion point / Self Assessment'];
      IIQ10 = (value.data)['needle insertion point / Instructor Evaluation'];
      IIQ11 = (value.data)['anatomy & injection procedure / Self Assessment'];
      IIQ12 =
          (value.data)['anatomy & injection procedure / Instructor Evaluation'];
      IIQ13 = (value
          .data)['ability to assess success of anesthesia / Self Assessment'];
      IIQ14 = (value.data)[
          'ability to assess success of anesthesia / Instructor Evaluation'];
    });
  }

  // This widget is the root of your application.
  int group1 = -1;
  int group2 = -1;
  int group3 = -1;
  int group = -1;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    I();
    II();
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
                  questionType(1, "Punctuality", 1, Ques1),
                  questionType(
                      2,
                      "Appropriate attire as described in Critical PPM",
                      2,
                      Ques2),
                  questionType(2, "Proper bench cleanliness", 3, Ques3),
                  questionType(1, "Tray organization", 4, Ques4),
                  questionType(
                      1,
                      "Understanding the indications, relevant anatomy, material selection, technique of procedure",
                      5,
                      Ques5),
                  questionType(1, "With Staff", 6, Ques6),
                  questionType(
                      3,
                      "Benches & instrument cleanliness and waste disposals",
                      7,
                      Ques7),
                  questionType(
                      2,
                      "Adherence to school’s ‘Code of Professional Conduct’",
                      8,
                      Ques8),
                  questionType(4, "Feedback", 9, Ques9),
                  SizedBox(
                    height: 35,
                  ),
                  Text("Section II",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    height: 5,
                  ),
                  sectionII("Preparation of armamentarium", 1, IIQ1, IIQ2),
                  sectionII("Syringe assembly for injection and aspiration", 2,
                      IIQ3, IIQ4),
                  sectionII("Operator & Manikin positions", 3, IIQ5, IIQ6),
                  sectionII("Identification soft and hard tissue landmarks", 4,
                      IIQ7, IIQ8),
                  sectionII("Needle insertion point", 5, IIQ9, IIQ10),
                  sectionII("Anatomy & injection procedure", 6, IIQ11, IIQ12),
                  sectionII("Ability to assess success of anesthesia", 7, IIQ13,
                      IIQ14),
                  SizedBox(
                    height: 5,
                  ),
                  sectionIV(
                      "Student’s overall ability to perform the protective",
                      III),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget questionType(
      int questiontype, String question, int questionNumber, String val) {
    I();
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
                    if (questionNumber == 1 && val == "Satisfactory")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (questionNumber == 4 && val == "Satisfactory")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (questionNumber == 5 && val == "Satisfactory")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (questionNumber == 6 && val == "Satisfactory")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (val == "Needs Improvement")
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
                    if (questionNumber == 1 && val == "Needs Improvement")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (questionNumber == 4 && val == "Needs Improvement")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (questionNumber == 5 && val == "Needs Improvement")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (questionNumber == 6 && val == "Needs Improvement")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (val == "Satisfactory")
                      Radio(
                        value: 1,
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
                    if (questionNumber == 2 && val == "Satisfactory")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (questionNumber == 3 && val == "Satisfactory")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (questionNumber == 8 && val == "Satisfactory")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (val != "Satisfactory")
                      Radio(
                        value: 1,
                        groupValue: group2,
                        onChanged: (value) {
                          setState(() {
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
                    if (questionNumber == 7 && val == "Satisfactory")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (val != "Satisfactory")
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
                    if (questionNumber == 7 && val == "Needs Improvement")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (val != "Needs Improvement")
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
                    if (questionNumber == 7 && val == "NA/NO")
                      Radio(
                        value: val,
                        groupValue: val,
                        onChanged: (T) {
                          setState(() {
                            group1 = T;
                          });
                        },
                      ),
                    if (val != "NA/NO")
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
                onChanged: (val) {},
                maxLines: 8,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: val,
                    border: OutlineInputBorder()),
              ),
            )
          ]));
        }
        break;
    }
  }

  Widget sectionII(
      String question, int questionNumber, String val, String val2) {
    String selfAssessment;
    String instructorEvaluation;

    return Stack(
      children: <Widget>[
        Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        if (val != 'Null')
          Container(
              height: 45,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4)),
              child: DropdownButtonFormField(
                isExpanded: true,
                hint: Text("  Self Assessment"),
                value: val,
                validator: (value) =>
                    value.isEmpty ? 'Choose the Position Please' : null,
                onChanged: (value) {},
                items: ['  0', '  1', '  2', '  NA'].map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        if (val == 'Null')
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
                  setState(() {
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
        if (val2 == 'Null')
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
        if (val2 != 'Null')
          Container(
            height: 45,
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4)),
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: Text("  Instructor Evaluation"),
              value: val2,
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

  Widget sectionIV(String question, String val) {
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
                if (val == 'Needs Improvement')
                  Radio(
                    value: val,
                    groupValue: val,
                    onChanged: (T) {
                      setState(() {
                        group = T;
                      });
                    },
                  ),
                if (val != 'Needs Improvement')
                  Radio(
                    value: 2,
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
                if (val == 'Competent')
                  Radio(
                    value: val,
                    groupValue: val,
                    onChanged: (T) {
                      setState(() {
                        group = T;
                      });
                    },
                  ),
                if (val != 'Competent')
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
                if (val == 'Above Expectation')
                  Radio(
                    value: val,
                    groupValue: val,
                    onChanged: (T) {
                      setState(() {
                        group = T;
                      });
                    },
                  ),
                if (val != 'Above Expectation')
                  Radio(
                    value: 2,
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
