import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/SignIn.dart';
import 'package:tester/Screens/services/auth.dart';
import 'package:tester/Screens/style.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String _selectedGender = "Male";

  String name = '';
  String id = '';
  String email = '';
  String password = '';
  String position = '  Academic Staff';
  String error = '';
  int activate;
  List<DropdownMenuItem<int>> genderList = [];

  void loadGenderList() {
    genderList.add(new DropdownMenuItem(
      child: new Text('Male'),
      value: 0,
    ));
    genderList.add(new DropdownMenuItem(
      child: new Text('Female'),
      value: 1,
    ));
  }

  @override
  void initState() {
    super.initState();
    loadGenderList();
  }

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
            body: Form(
                key: _formkey,
                child: ListView(children: [
                  Align(
                    alignment: Alignment.center,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 70, 0, 35),
                    child: Image.asset(
                      'Assets/Checkpoint.png',
                      height: 100,
                    ),
                  ),
//................................ Name Container.....................................
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Name',
                            labelText: 'Name',
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                          ),
                          onChanged: (val) {
                            setState(() => name = val);
                          },
                          validator: (value) => value.isEmpty
                              ? 'Enter a Full Name Please'
                              : null)),
//................................ Email Container.....................................
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 9),
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                          ),
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          validator: (value) =>
                              value.isEmpty ? 'Enter the Email Please' : null)),
                  //................................ Id Number Container.....................................
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Id Number',
                          labelText: 'Id Number',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                        ),
                        validator: (value) => value.length < 7
                            ? 'The id must be 7+ numbe Please'
                            : null,
                        onChanged: (val) {
                          setState(() => id = val);
                        },
                      )),
//................................ Position Container.....................................
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      hint: Text("  Position"),
                      value: position,
                      validator: (value) =>
                          value.isEmpty ? 'Choose the Position Please' : null,
                      onChanged: (value) {
                        setState(() {
                          position = value;
                        });
                      },
                      items:
                          //genderList,

                          ['  Academic Staff', '  Student'].map((value) {
                        return new DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ));
                      }).toList(),
                    ),
                  ),
//................................ Password Container.....................................
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                        ),
                        validator: (value) => value.length < 6
                            ? 'Enter a password with 6+ Please'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      )),
                  SubmitButtons(
                      text: "Sign Up",
                      onpressed: () async {
                        if (_formkey.currentState.validate()) {
                          if (position == '  Academic Staff') {
                            creatUserAcademicStaff();
                          } else if (position == '  Student') {
                            creatUserStudent();
                          }
                        }
                      }),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),

                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
                          child: Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Container(
                            child: TextButton(
                                child: Text("Sign in"),
                                onPressed: () {
                                  runApp(SignIn());
                                }))
                      ]))
                ]))));
  }

  void creatUserAcademicStaff() async {
    dynamic result = await _auth.registerProcessAcademicStaff(
        email, password, name, id, position, activate);

    if (result == null) {
      setState(() => error = 'Check Your Input Again');
    } else {
      runApp(SignIn());
    }
  }

  void creatUserStudent() async {
    dynamic result = await _auth.registerProcessStudent(
        email, password, name, id, position, activate);
    if (result == null) {
      setState(() => error = 'Check Your Input Again');
    } else {
      runApp(SignIn());
    }
  }
}
