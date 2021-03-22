import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  TextStyle style = new TextStyle(
    color: Colors.black
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/microsoft_logo.png")
            )
          ),
        ),
        title: Text(
          "Fluent UI Design Flutter",
          style: style,
        ),
      ),
    );
  }
}