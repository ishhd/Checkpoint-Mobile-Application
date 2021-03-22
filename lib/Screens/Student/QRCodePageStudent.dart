import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';
import 'package:tester/Screens/style.dart';

class QRCodePageStudent extends StatefulWidget {
  State<StatefulWidget> createState() {
    return QRCodePageStudentState();
  }
}

class QRCodePageStudentState extends State<QRCodePageStudent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFFD9D9D9),
            title: Text(
              "QR Code",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF525151),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                runApp(HomePageStudent());
              },
              color: Color(0xFF525151),
              iconSize: 20,
              padding: EdgeInsets.only(left: 20),
            ),
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(alignment: Alignment.center),
            Container(
                margin: EdgeInsets.only(bottom: 60),
                child: Image.asset(''), //student qr code
                width: 300,
                height: 300,
                color: Colors.grey[300]),
            SubmitButtons(
              text: "Download Image",
              onpressed: () {},
            ),
          ]),
        ));
  }
}
