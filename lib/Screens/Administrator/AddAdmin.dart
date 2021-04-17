import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:tester/Screens/profile.dart';
import 'package:tester/Screens/services/auth.dart';
import 'package:tester/Screens/style.dart';

final userRef = Firestore.instance.collection('user');

class AddAdmin extends StatefulWidget with NavigationStates {
  @override
  _AddAdminState createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  String name = '';
  String id = '';
  String email = '';
  String password = '';
  final AuthService _auth = AuthService();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFD9D9D9),
            title: Text(
              "New Admin",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF525151),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                runApp(HomeScreen(widget: Profile()));
              },
              color: Color(0xFF525151),
              iconSize: 20,
              padding: EdgeInsets.only(left: 20),
            ),
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
                              border: Border.all(
                                  width: 4, color: Color(0xFF98D1D4)),
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
                  buildTextField("Password", password),
                  SizedBox(
                    height: 35,
                  ),
                  SubmitButtons(
                    text: "Save",
                    onpressed: () {
                      creatUserAdmin();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Save these information"),
                            content: new Text(
                                "Do you want to save these information"),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text("Yes"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  creatUserAdmin();
                                },
                              ),
                              new FlatButton(
                                child: new Text("No"),
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
                ],
              ),
            ),
          ),
        ));
  }

  void creatUserAdmin() async {
    dynamic result = await _auth.AddNewAdmin(email, password, name, id);

    if (result == null) {
      setState(() => error = 'Check Your Input Again');
    } else {}
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
          if (labelText == "Password") {
            password = placeholder;
          }
        },
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
