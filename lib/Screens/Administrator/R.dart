import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tester/Screens/model/User.dart';

class Requests2 extends StatefulWidget with NavigationStates {
  State<StatefulWidget> createState() {
    return Requests2State();
  }
}

class Requests2State extends State<Requests2> {
  List fullNames = [
    "Shahad Harith",
    "Rewaa Alalawi",
    "Ameera Aloufi",
  ];

  List idNumbers = [
    "1234567",
    "1234567",
    "1234567",
  ];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: requestList(),
        //drawer: SideBarLayout(),
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
    final ActUser = Provider.of<QuerySnapshot>(context);
    for (var doc in ActUser.documents) {
      print(doc.data);
    }

    /* if (fullNames.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "There are no incoming requests!",
          style: TextStyle(fontSize: 17, color: Colors.grey),
        ),
      );
    } */

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
                        Text(fullNames[index],
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        Text("Student or Academic Staff",
                            style: TextStyle(color: Colors.grey)),
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
