import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap})
      : super(key: key);
  Future<bool> _willPopCallback() async {
    print("object");
    // await showDialog or Show add banners or whatever
    // then
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _willPopCallback,
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
