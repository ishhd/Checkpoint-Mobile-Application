import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tester/Screens/AcademicStaff/EvaluationFormsAS.dart';
import 'package:tester/Screens/model/evaluationforms/OMR512.dart';
import 'package:tester/Screens/style.dart';

String uid = 'NtQTZ2dZp4e8WSZ9J1rYW1ugvyC3';

class FormsAS extends StatefulWidget {
  State<StatefulWidget> createState() {
    return FormsASState();
  }
}

class FormsASState extends State<FormsAS> {
  // This widget is the root of your application.
  int group1 = -1;
  int group2 = -1;
  int group3 = -1;
  int group = -1;
  String name = '';
  String iname = '';
  String selfAssessmentP = '';
  String selfAssessmentO = '';
  String selfAssessmentI = '';
  String selfAssessmentN = '';
  String selfAssessmentA = '';
  String selfAssessmentB = '';
  String instructorEvaluationP = '';
  String selfAssessmentS = '';
  String instructorEvaluationS = '';
  String aplity = '';

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
                  Container(
                      height: 40,
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        onChanged: (val) {
                          iname = val;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Evaluator Name"),
                      )),
                  Container(
                      height: 40,
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        onChanged: (val) {
                          name = val;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Student Name"),
                      )),
                  Container(
                      height: 40,
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        onChanged: (val) {
                          name = val;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Student ID"),
                      )),
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
                  sectionII("Preparation of armamentarium", 1),
                  sectionII("Syringe assembly for injection and aspiration", 2),
                  sectionII("Operator & Manikin positions", 3),
                  sectionII("Identification soft and hard tissue landmarks", 4),
                  sectionII("Needle insertion point", 5),
                  sectionII("Anatomy & injection procedure", 6),
                  sectionII("Ability to assess success of anesthesia", 7),
                  SizedBox(
                    height: 5,
                  ),
                  sectionIV(
                      "Student’s overall ability to perform the protective"),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SubmitButtons(
                        text: "Save",
                        onpressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Save answers"),
                                content: new Text(
                                    "Do you want to save these answers?"),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Yes"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
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
                        text: "Export",
                        onpressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Export.."),
                                content: new Text(
                                    "Do you want to export this form to:"),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Excel Sheet"),
                                    onPressed: () async {
                                      await http.get(
                                          "https://script.google.com/macros/s/AKfycbzFAC6ilUBL8AqKLmRcazkElHbGYUYAKJxn0_bKINZhCAq0-9kplPQlcr_sHlUJifSHqQ/exec?name1=$name&&name2=$selfAssessmentP&&name3=$selfAssessmentS&&name4=$selfAssessmentO&&name5=$selfAssessmentI&&name6=$selfAssessmentN&&name7=$selfAssessmentA&&name8=$selfAssessmentB&&name9=$aplity&&name10=$iname");

                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  new FlatButton(
                                    child: new Text("Back"),
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
                    height: 30,
                  )
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
                        if (questionNumber == 1) {
                          evaluationform().Punctuality(uid, '1');
                        } else if (questionNumber == 4) {
                          evaluationform().Tray(uid, '1');
                        } else if (questionNumber == 5) {
                          evaluationform().Understanding(uid, '1');
                        } else if (questionNumber == 6) {
                          evaluationform().WithStaff(uid, '1');
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
                        if (questionNumber == 1) {
                          evaluationform().Punctuality(uid, '2');
                        } else if (questionNumber == 4) {
                          evaluationform().Tray(uid, '2');
                        } else if (questionNumber == 5) {
                          evaluationform().Understanding(uid, '2');
                        } else if (questionNumber == 6) {
                          evaluationform().WithStaff(uid, '2');
                        }
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
                      onChanged: (T) {
                        if (questionNumber == 2) {
                          evaluationform().Appropriate(uid, '1');
                        } else if (questionNumber == 3) {
                          evaluationform().Proper(uid, '1');
                        } else if (questionNumber == 3) {
                          evaluationform().Adherence(uid, '1');
                        }
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
              margin: EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: group3,
                      onChanged: (T) {
                        if (questionNumber == 7) {
                          evaluationform().Benches(uid, '1');
                        }
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
                          if (questionNumber == 7) {
                            evaluationform().Benches(uid, '2');
                          }
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
                          if (questionNumber == 7) {
                            evaluationform().Benches(uid, 'NA/NO');
                          }
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
                  evaluationform().feedback(uid, val);
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

  Widget sectionII(String question, int questionNumber) {
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
                setState(() {
                  selfAssessment = value;
                });
                if (questionNumber == 1) {
                  evaluationform().PreparationSA(uid, value);
                } else if (questionNumber == 2) {
                  evaluationform().SyringeSA(uid, value);
                } else if (questionNumber == 3) {
                  evaluationform().OperatorSA(uid, value);
                } else if (questionNumber == 4) {
                  evaluationform().IdentificationSA(uid, value);
                } else if (questionNumber == 5) {
                  evaluationform().NeedleSA(uid, value);
                } else if (questionNumber == 6) {
                  evaluationform().AnatomySA(uid, value);
                } else if (questionNumber == 7) {
                  evaluationform().abilitySA(uid, value);
                }
                if (question.contains("Preparation")) {
                  selfAssessmentP = value;
                } else if (question.contains("Syringe")) {
                  selfAssessmentS = value;
                } else if (question.contains("Operator")) {
                  selfAssessmentO = value;
                } else if (question.contains("Identification")) {
                  selfAssessmentI = value;
                } else if (question.contains("Needle")) {
                  selfAssessmentN = value;
                } else if (question.contains("Anatomy")) {
                  selfAssessmentA = value;
                } else {
                  selfAssessmentB = value;
                }
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
              if (questionNumber == 1) {
                evaluationform().PreparationIE(uid, value);
              } else if (questionNumber == 2) {
                evaluationform().SyringeIE(uid, value);
              } else if (questionNumber == 3) {
                evaluationform().OperatorIE(uid, value);
              } else if (questionNumber == 4) {
                evaluationform().IdentificationIE(uid, value);
              } else if (questionNumber == 5) {
                evaluationform().NeedleIE(uid, value);
              } else if (questionNumber == 6) {
                evaluationform().AnatomyIE(uid, value);
              } else if (questionNumber == 7) {
                evaluationform().abilityIE(uid, value);
              }
              if (question.contains("Preparation")) {
                instructorEvaluationP = value;
              } else {
                instructorEvaluationS = value;
              }
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
                    evaluationform().overall(uid, '1');
                    setState(() {
                      group = T;
                    });
                    aplity = "Needs Improvement";
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
                    evaluationform().overall(uid, '2');

                    setState(() {
                      group = T;
                    });
                    aplity = "Competent";
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
                    evaluationform().overall(uid, '3');
                    setState(() {
                      group = T;
                    });
                    aplity = "Above Expectation";
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
