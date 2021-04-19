import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/AddAdmin.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:tester/Screens/model/User.dart';
import 'package:tester/Screens/style.dart';

final userRef = Firestore.instance.collection('user');

class Profile extends StatefulWidget with NavigationStates {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String id = '';
  String email = '';
  String Position = '';

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    final String uid = '4L4GSLTUJvPjZGiM8sN4JXh0qOt2';
    final DocumentSnapshot doc =
        await userRef.document(uid).get().then((value) {
      name = (value.data)['name'];
      id = (value.data)['id'];
      email = (value.data)['email'];
      Position = (value.data)['position'];
    });
    //name = doc.data as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD9D9D9),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 30,
            color: Color(0xFF525151),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 4, color: Color(0xFF98D1D4)),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'Assets/ProfilePicture.png',
                              ))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", name),
              buildTextField("Id", id),
              buildTextField("E-mail", email),
              buildTextField("Position", Position),
              SizedBox(
                height: 35,
              ),
              //if (User== admin)
              SubmitButtons(
                text: "Add another admin",
                onpressed: () {
                  runApp(MaterialApp(
                      debugShowCheckedModeBanner: false, home: AddAdmin()));
                },
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        onChanged: (val) {
          setState(() => placeholder = val);
          if (labelText == "Full Name") {
            name = placeholder;
          }
          if (labelText == "Id") {
            id = placeholder;
          }
          if (labelText == "E-mail") {
            email = placeholder;
          }
          if (labelText == "Position") {
            Position = placeholder;
          }
        },
        readOnly: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
