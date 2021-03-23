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
          Text(
            "Fluent UI Design Flutter",
            style: style,
          ),
        ],
      ),
    );
  }
}