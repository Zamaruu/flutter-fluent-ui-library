import 'package:fluent_ui_design/ui/fluentui/fluentbutton.dart';
import 'package:flutter/material.dart';

fluentDialog(BuildContext context, String header, Widget body,
    {List<Widget> actions}) {
  showDialog(
    context: context,
    builder: (context) {
      String contentText = "Content of Dialog";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Title of Dialog"),
            content: Text(contentText),
            shape: Border(top: BorderSide(width: 4.5, color: Colors.blue[600])),
            actions: <Widget>[
              DefaultButton(
                "Ändern",
                onPressed: () {
                  setState(() {
                    contentText = "Changed Content of Dialog";
                  });
                },
              ),
              DefaultButton.standard(
                "Abbrechen",
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    },
  );
}
