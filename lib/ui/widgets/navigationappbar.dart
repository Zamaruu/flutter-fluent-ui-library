import 'package:flutter/material.dart';

class NavigationAppbar extends StatelessWidget {
  TextStyle style = new TextStyle(
    color: Colors.black
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          // Container(
          //   margin: EdgeInsets.only(right: 20),
          //   width: 150,
          //   child: Image.asset("images/microsoft_logo.png"),
          // ),
          Text(
            "Fluent UI Design Flutter",
            style: style,
          ),
        ],
      ),
    );
  }
}