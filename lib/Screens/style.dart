import 'package:flutter/material.dart';

class Text_Field extends StatelessWidget {
  final String label;
  final bool secure;
  @override
  const Text_Field(
      {Key key, this.label, this.secure, TextEditingController controller})
      : super(key: key);
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 40,
        margin: EdgeInsets.only(bottom: 10),
        child: TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: this.label),
          obscureText: secure,
        ));
  }
}

class SubmitButtons extends StatelessWidget {
  @override
  final String text;
  final Function onpressed;
  const SubmitButtons({Key key, this.text, this.onpressed}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 40,
        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
        alignment: Alignment.center,
        child: RaisedButton(
            color: Color(0xFF98D1D4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Text(
              this.text,
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            onPressed: onpressed));
  }
}

class MenuButtons extends StatelessWidget {
  @override
  final String label;
  final Function onpressed;
  const MenuButtons({Key key, this.label, this.onpressed}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 75,
        margin: EdgeInsets.fromLTRB(50, 15, 35, 15),
        child: RaisedButton(
            color: Color(0xFF98D1D4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              this.label,
              style: TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            onPressed: onpressed));
  }
}

class CoursesButtons extends StatelessWidget {
  @override
  final String label;
  final Function onpressed;
  final Color color;
  const CoursesButtons({Key key, this.label, this.onpressed, this.color})
      : super(key: key);
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 75,
        margin: EdgeInsets.fromLTRB(50, 15, 35, 15),
        child: RaisedButton(
            color: this.color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              this.label,
              style: TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            onPressed: onpressed));
  }
}
