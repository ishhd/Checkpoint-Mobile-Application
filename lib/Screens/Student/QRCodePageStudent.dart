import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:tester/Screens/Administrator/AddAdmin.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';
import 'package:tester/Screens/style.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class QRCodePageStudent extends StatefulWidget {
  State<StatefulWidget> createState() {
    return QRCodePageStudentState();
  }
}

class QRCodePageStudentState extends State<QRCodePageStudent> {
  String qrCodeUrl;
  String uid;

  getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid;

    final DocumentSnapshot doc =
        // ignore: missing_return
        await userRef.document(user.uid).get().then((value) {
      qrCodeUrl = (value.data)['qrCodeUrl'];
    });
    //name = doc.data as String;
  }

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return image;
  }

  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;
  GlobalKey globalKey = new GlobalKey();
  String _dataString = "Hello from this QR";
  String _inputErrorText;
  final TextEditingController _textController = TextEditingController();

  String _imagePath;

  @override
  Widget build(BuildContext context) {
    getUser();
    // TODO: implement build
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFD9D9D9),
            title: Text(
              "QR code",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF525151),
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                runApp(HomeScreen(widget: HomePageStudent()));
              },
              color: Color(0xFF525151),
              iconSize: 20,
              padding: EdgeInsets.only(left: 20),
            ),
          ),
          backgroundColor: Colors.white,
          body: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(alignment: Alignment.center),
                SizedBox(
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 35),
                  child: Text(qrCodeUrl),
                ),

                /* QrImage(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    data: _dataString,
                    size: 200),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 70, 0, 35),
                    child: FutureBuilder(
                      future: _getImage(context, uid),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 11,
                            height: 12,
                            child: snapshot.data,
                          );
                        }
                      },
                    )),*/
                SubmitButtons(
                  text: "Download Image",
                  onpressed: () {
                    loadImage();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("Download QR code"),
                          content: new Text("It has successfully downloaded"),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("Ok"),
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
              ]),
        ));
  }

  void saveImage(path) async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString('imagepath', path);
  }

  void loadImage() async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = saveImage.getString('imagepath');
    });
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
