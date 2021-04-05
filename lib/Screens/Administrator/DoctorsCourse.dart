import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/SchedulesAdmin.dart';

class DoctorsCourse extends StatefulWidget {
  final List<String> doctors;
  final Color color;

  const DoctorsCourse({Key key, this.doctors, this.color}) : super(key: key);
  @override
  _DoctorsCourseState createState() => _DoctorsCourseState();
}

class _DoctorsCourseState extends State<DoctorsCourse> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFD9D9D9),
          title: Text(
            "Doctors Course",
            style: TextStyle(
              fontSize: 30,
              color: Color(0xFF525151),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              runApp(SchedulesAdmin());
            },
            color: Color(0xFF525151),
            iconSize: 20,
            padding: EdgeInsets.only(left: 20),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.doctors
              .map(
                (e) => Expanded(
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: widget.color,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: AutoSizeText(
                          e,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
