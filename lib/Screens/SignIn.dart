import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/AddAdmin.dart';
import 'package:tester/Screens/model/User.dart';
import 'package:tester/Screens/profile.dart';
import 'package:tester/Screens/services/auth.dart';
import 'package:tester/Screens/SignUp.dart';
import 'package:tester/Screens/style.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void initState() {
    super.initState();
  }

  getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final DocumentSnapshot doc =
        // ignore: missing_return
        await userRef.document(user.uid).get().then((value) {
      var state = (value.data)['activate'];
      if (state == 0) {
        n = 1;
      } else {
        n = 0;
      }
    });
  }

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  int n;
  String email = '';
  String password = '';
  String error = '';
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
          body: Center(
              child: Form(
                  key: _formkey,
                  child: ListView(
                    children: [
                      Align(alignment: Alignment.center),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 70, 0, 35),
                        child: Image.asset(
                          'Assets/Checkpoint.png',
                          height: 100,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                labelText: 'Email',
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              validator: (value) => value.isEmpty
                                  ? 'Enter the Email Please'
                                  : null)),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            validator: (value) => value.length < 6
                                ? 'Enter a password with 6+ Please'
                                : null,
                          )),
                      Container(
                        child: TextButton(
                          child: Text("Forget my password"),
                          onPressed: () {
                            // User().Activate();
                            //runApp(ResetPass());
                          },
                        ),
                      ),
                      SubmitButtons(
                          text: "Sign In",
                          onpressed: () async {
                            getUser();
                            if (_formkey.currentState.validate()) {
                              dynamic result =
                                  await _auth.SignInProcess(email, password);
                              if (n == 1) {
                                setState(
                                    () => error = 'Soory Your Account on Hold');
                              } else {
                                setState(
                                    () => error = 'Check Your Input Again');
                              }
                              /*  if (result == null) {
                                setState(
                                    () => error = 'Check Your Input Again');
                              } else {
                                String n = User().state;
                                setState(() => error = n);
                              }*/
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
                                "Don\' have an account?",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                  child: Text("Sign up"),
                                  onPressed: () {
                                    runApp(SignUp());
                                  }),
                            ),
                          ]))
                    ],
                  ))),
        ));
  }
}
