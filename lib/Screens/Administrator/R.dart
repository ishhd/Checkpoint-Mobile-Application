import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tester/Screens/model/User.dart';
import 'package:tester/Screens/style.dart';

class Acti extends StatefulWidget {
  Acti({Key key}) : super(key: key);


  @override
  _ActiState createState() => _ActiState();
}

class _ActiState extends State<Acti> {
  @override
  Widget build(BuildContext context) {
    //StreamProvider<List<User>>.value(
    // value: User().user,
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: Colors.white),
        home: Scaffold(
            body: Container(
          child: SubmitButtons(
              text: "Sign Up",
              onpressed: () async {
                User().PrintUs();
              }),
        )));
  }
}

/*class UserList extends StatefulWidget {
  UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<List<User>>(context);
    user.forEach((user) {
      print(user.name);
    });
    return Container();
  }
}
*/