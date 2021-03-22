import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Sidebar/sidebar_layout.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';

class SidebarHome extends StatefulWidget with NavigationStates {
  State<StatefulWidget> createState() {
    return SidebarHomeState();
  }
}

class SidebarHomeState extends State<SidebarHome> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SideBarLayout());
  }
}
