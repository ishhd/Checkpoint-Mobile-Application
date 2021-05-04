import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tester/Screens/SignIn.dart';
import 'package:tester/Screens/services/auth.dart';
import 'package:tester/Screens/style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool show = false;

  String name = '';
  String id = '';
  String email = '';
  String password = '';
  String position = '  Academic Staff';
  String error = '';
  int activate;
  List<DropdownMenuItem<int>> genderList = [];

  FirebaseUser userr;

  bool loading = false;

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

  GlobalKey globalKey = new GlobalKey();

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
                  !loading
                      ? Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 5),
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
                                  : null))
                      : Container(),
//................................ Email Container.....................................
                  !loading
                      ? Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 9),
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
                                  : null))
                      : Container(),
                  //................................ Id Number Container.....................................
                  !loading
                      ? Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 5),
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
                          ))
                      : Container(),
                  !loading
                      ?
//................................ Position Container.....................................
                      Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4)),
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Text("  Position"),
                            value: position,
                            validator: (value) => value.isEmpty
                                ? 'Choose the Position Please'
                                : null,
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
                        )
                      : Container(),
//................................ Password Container.....................................
                  !loading
                      ? Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 5),
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
                          ))
                      : Container(),
                  !loading
                      ? SubmitButtons(
                          text: "Sign Up",
                          onpressed: () async {
                            if (_formkey.currentState.validate()) {
                              if (position == '  Academic Staff') {
                                creatUserAcademicStaff();
                              } else if (position == '  Student') {
                                creatUserStudent();
                              }
                            }
                          })
                      : !loading
                          ? Container(
                              alignment: Alignment.center,
                              child: Text(
                                error,
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : Container(),

                  !loading
                      ? Container(
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
                      : Container(),
                  loading
                      ? SpinKitFadingCube(
                          itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color:
                                  index.isEven ? Colors.blue : Colors.grey[200],
                            ),
                          );
                        })
                      : Container(),
                  show
                      ? SizedBox(
                          height: 15,
                        )
                      : Container(),
                  show
                      ? Center(
                          // height: 250,
                          child: RepaintBoundary(
                          key: globalKey,
                          child: QrImage(
                            data: userr != null ? userr.uid : "test",
                            size: 320,
                            errorStateBuilder: (cxt, err) {
                              return Container(
                                child: Center(
                                  child: Text(
                                    "Uh oh! Something went wrong...",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                        ))
                      : Container(),
                ]))));
  }

  storeNewUser(FirebaseUser user, File f, name) async {
    var time = DateTime.now();
    StorageUploadTask task;
    print("File: ${f}");

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('userQrCodes/${user.uid}.png');
    task = firebaseStorageRef.putFile(f);

    StorageTaskSnapshot snapshot = await task.onComplete;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    print("DownloadUrl: ${downloadUrl}");

    Firestore.instance.collection('student').document(user.uid).updateData({
      'uid': user.uid,
      'qrCodeUrl': downloadUrl,
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);
      await storeNewUser(userr, file, name);
    } catch (e) {
      print(e.toString());
    }
  }

  void creatUserAcademicStaff() async {
    dynamic result = await _auth.registerProcessAcademicStaff(
        email, password, name, id, position, activate);

    if (result == null) {
      ;

      setState(() => error = 'Check Your Input Again');
      show = false;
    } else {
      runApp(SignIn());
    }
  }

  void creatUserStudent() async {
    setState(() {
      show = true;
      loading = true;
    });

    dynamic result = await _auth.registerProcessStudent(
        email, password, name, id, position, activate);
    if (result == null) {
      setState(() {
        loading = false;
      });
      setState(() => error = 'Check Your Input Again');
    } else {
      setState(() {
        userr = result;
        print("dattta:${result.uid}");
      });
      setState(() {
        Timer(Duration(seconds: 4), () {
          print("Yeah, this line is printed after 3 seconds");
          _captureAndSharePng();

          loading = false;
          //print("data:$result");
          runApp(SignIn());
        });
      });
    }
  }
}
