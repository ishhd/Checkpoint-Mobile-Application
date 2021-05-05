import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/AddAdmin.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:tester/Screens/model/User.dart';

class Requestsstaff extends StatefulWidget with NavigationStates {
  State<StatefulWidget> createState() {
    return RequestsstaffState();
  }
}

class RequestsstaffState extends State<Requestsstaff> {
  String name = '';
  String id;
  String uid;
  String position;

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
      ),
    );
  }

  activation(String email) {
    setState(() {
      //fullNames.removeAt(index);
      userRef.document(email).updateData({
        'activate': 1,
      }).catchError((e) {
        print(e);
      });
      //change student activation case
    });
  }

  Widget requestList() {
    return FutureBuilder<QuerySnapshot>(
        future: userRef
            .where("activate", isEqualTo: 0)
            .where("position", isEqualTo: "  Academic Staff")
            .getDocuments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> userr = snapshot.data.documents;
            return ListView(
                padding: EdgeInsets.only(top: 13),
                children: userr
                    .map(
                      (doc) => Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                                    Text(doc["name"],
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18)),
                                    SizedBox(height: 10),
                                    Text(doc["position"],
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: FlatButton(
                                onPressed: () {
                                  activation(doc.documentID);
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
                    )
                    .toList());
          } else
            return Container(
              alignment: Alignment.center,
              child: Text(
                "There are no incoming requests!",
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            );
        });
  }
}
