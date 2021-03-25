import 'package:flutter/material.dart';

class CommandBarButtonModel {
  final String title;
  final IconData icon;
  final Function onPressed;

  CommandBarButtonModel(this.title, this.icon, this.onPressed);
}