import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/SignIn.dart';
import 'package:tester/Screens/services/auth.dart';
import 'package:tester/Screens/style.dart';

class ResetPass extends StatefulWidget {
  ResetPass({Key key}) : super(key: key);

  @override
  _ResetPass createState() => _ResetPass();
}

class _ResetPass extends State<ResetPass> {
  void initState() {
    super.initState();
  }

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email;
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
                          height: 45,
                          margin:
                              EdgeInsets.symmetric(horizontal: 70, vertical: 9),
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
                              validator: (value) => value.isEmpty
                                  ? 'Enter the Email Please'
                                  : null)),
                      SizedBox(
                        height: 20,
                      ),
                      SubmitButtons(
                          text: "Reset Password",
                          onpressed: () async {
                            await _auth.resetPassword(email);
                            runApp(SignIn());
                          }),
                      Container(
                        child: SizedBox(
                          height: 12,
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          child: Text("Back to sign in"),
                          onPressed: () {
                            runApp(SignIn());
                          },
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
