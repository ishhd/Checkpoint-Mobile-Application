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
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
