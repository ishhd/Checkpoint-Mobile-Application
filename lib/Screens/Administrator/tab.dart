import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/Requestsadmin.dart';
import 'package:tester/Screens/Administrator/Requestsqtaff.dart';

import 'package:tester/Screens/Administrator/Requestsstud.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';

class Requesttab extends StatefulWidget with NavigationStates {
  State<StatefulWidget> createState() {
    return RequesttabState();
  }
}

class RequesttabState extends State<Requesttab> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Requests')),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.supervised_user_circle),
                  text: 'Student',
                ),
                Tab(
                  icon: Icon(Icons.verified_user),
                  text: 'Academic Staff',
                ),
                Tab(
                  icon: Icon(Icons.admin_panel_settings),
                  text: 'Administrator',
                ),
              ],
            ),
            // title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [Requestsstud(), Requestsstaff(), Requestsadmin()],
          ),
        ),
      ),
    );
  }
}
