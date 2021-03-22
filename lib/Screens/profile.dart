import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Sidebar/sidebar_layout.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:tester/Screens/style.dart';

class Profile extends StatefulWidget with NavigationStates {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarLayout(),
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
              buildTextField("Full Name", "Dor Alex"),
              buildTextField("Id", "1234567"),
              buildTextField("E-mail", "alexd@gmail.com"),
              buildTextField("Position", "Administarator"),
              SizedBox(
                height: 35,
              ),
              SubmitButtons(
                text: "Add another admin",
                onpressed: () {},
              ),
              SubmitButtons(
                text: "Save",
                onpressed: () {},
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
