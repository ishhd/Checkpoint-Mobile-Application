import 'package:flutter/material.dart';
import 'package:tester/Screens/services/auth.dart';

import 'sidebar.dart';

class HomeScreen extends StatefulWidget {
  final Widget widget;

  const HomeScreen({Key key, this.widget}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _willPopCallback() async {
    print("object");
    // await showDialog or Show add banners or whatever
    // then
    return Future.value(false);
  }

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _willPopCallback,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Scaffold(
            body: Stack(
              children: <Widget>[
                widget.widget,
                SideBar(),
              ],
            ),
          ),
        ));
  }
}
