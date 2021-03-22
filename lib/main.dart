import 'package:fluent_ui_design/routes/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(FluentUIDesign());
}

class FluentUIDesign extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
