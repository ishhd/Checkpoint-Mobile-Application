import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tester/Screens/AcademicStaff/homePageAS.dart';
import 'package:tester/Screens/Administrator/Requests.dart';
import 'package:tester/Screens/Administrator/SchedulesAdmin.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/Sidebar/home_screen.dart';
import 'package:tester/Screens/SignIn.dart';
import 'package:tester/Screens/Student/homePageStudent.dart';
import 'package:tester/Screens/model/User.dart';
import 'package:tester/Screens/profile.dart';
import 'package:tester/Screens/services/auth.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../Sidebar/menu_item.dart';

final AuthService _auth = AuthService();
String position;
String name;

//User currentUser;
//String uid = currentUser.uid;

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final DocumentSnapshot doc =
        // ignore: missing_return
        await userRef.document(user.uid).get().then((value) {
      position = (value.data)['position'];
      name = (value.data)['name'];
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    final AuthService _auth = AuthService();

    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: const Color(0xFF98D1D4),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          position,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.5),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          getUser();
                          if (position == 'Admin') {
                            onIconPressed();

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                      widget: homePageAdministrator()),
                                ),
                                (Route<dynamic> route) => true);
                          } else if (position == '  Academic Staff') {
                            onIconPressed();

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen(widget: homepageAS()),
                                ),
                                (Route<dynamic> route) => true);
                          } else if (position == '  Student') {
                            onIconPressed();

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen(widget: HomePageStudent()),
                                ),
                                (Route<dynamic> route) => true);
                          }
                        },
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: "My Profile",
                        onTap: () {
                          onIconPressed();

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen(widget: Profile()),
                              ),
                              (Route<dynamic> route) => false);
                        },
                      ),
                      if (position == 'Admin')
                        MenuItem(
                          icon: Icons.archive,
                          title: "Requests",
                          onTap: () {
                            onIconPressed();

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen(widget: Requests()),
                                ),
                                (Route<dynamic> route) => false);
                          },
                        ),
                      MenuItem(
                        icon: Icons.table_chart_sharp,
                        title: "Schedule",
                        onTap: () {
                          onIconPressed();

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen(widget: SchedulesAdmin()),
                              ),
                              (Route<dynamic> route) => false);
                        },
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                        onTap: () async {
                          await _auth.signOut();
                          runApp(SignIn());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF98D1D4),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
