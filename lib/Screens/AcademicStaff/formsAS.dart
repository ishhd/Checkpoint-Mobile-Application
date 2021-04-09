import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/AcademicStaff/EvaluationFormsAS.dart';
import 'package:tester/Screens/model/evaluationforms/evaluationform.dart';
import 'package:tester/Screens/style.dart';

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
                  Text("Section I",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    height: 5,
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
                  Text("Section II",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    height: 5,
                  ),
                  sectionII("Preparation of armamentarium"),
                  sectionII("Syringe assembly for injection and aspiration"),
                  SizedBox(
                    height: 5,
                  ),
                  sectionIV(
                      "Student’s overall ability to perform the protective"),
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
                            title: new Text("Save answers"),
                            content:
                                new Text("Do you want to save these answers?"),
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
              margin: EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: group1,
                      onChanged: (T) {
                        evaluationform()
                            .Punctuality('pPPyWG67qcg30OGyFb0nn4AiJ6X2', '1');
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
                        evaluationform()
                            .Punctuality('07Pgmy307rU1i1SpzQGh053TtTB3', '2');
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
                        evaluationform()
                            .Appropriate('07Pgmy307rU1i1SpzQGh053TtTB3', '1');
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
