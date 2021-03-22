import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text("Fluent UI Flutter"),
            ),
          )
        ],
      ),
    );
  }
}