import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/AddAdmin.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';

class Requests extends StatefulWidget with NavigationStates {
  State<StatefulWidget> createState() {
    return RequestsState();
  }
}

class RequestsState extends State<Requests> {
  String name = '';
  String id;
  String uid;
  String position;
  getUser() async {
    final DocumentSnapshot doc =
        // ignore: missing_return
        await userRef.document(uid).get().then((value) {
      name = (value.data)['name'];
      id = (value.data)['id'];
      position = (value.data)['position'];
    });
  }

  activate(String uid) async {
    final DocumentSnapshot doc =
        // ignore: missing_return
        await userRef.document(uid).get().then((value) {
      name = (value.data)['name'];
      id = (value.data)['id'];
      position = (value.data)['position'];
      uid = (value.data)['uid'];
    });

    final user = <Widget>[];
    for (var i = 0; i < 10; i++) {
      user.add(new ListTile());
    }
  }

  List fullNames = [];

  List idNumbers = [
    "1707861",
    "1708664",
    "1708103",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.white),
      home: Scaffold(
        body: requestList(),
        appBar: AppBar(
          backgroundColor: Color(0xFFD9D9D9),
          title: Text(
            "Requests",
            style: TextStyle(
              fontSize: 30,
              color: Color(0xFF525151),
            ),
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  activation(index) {
    setState(() {
      fullNames.removeAt(index);
      //change student activation case
    });
  }

  Widget requestList() {
    if (fullNames.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "There are no incoming requests!",
          style: TextStyle(fontSize: 17, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: fullNames.length,
      itemBuilder: (BuildContext context, int index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.only(left: 25, top: 5),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        Text("Student", style: TextStyle(color: Colors.grey)),
                        Text(idNumbers[index],
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: FlatButton(
                    onPressed: () {
                      activation(index);
                    },
                    color: Color(0xFF98D1D4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Activate",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
