import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Image.asset("images/microsoft_logo.png"),
          Text("Fluent UI Flutter"),
        ],
      ),
    );
  }
}