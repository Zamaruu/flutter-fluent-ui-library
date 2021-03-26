import 'package:fluent_ui_design/ui/fluentui/fluentbutton.dart';
import 'package:fluent_ui_design/ui/fluentui/fluentdocumentcard.dart';
import 'package:fluent_ui_design/ui/fluentui/fluentpanel.dart';
import 'package:fluent_ui_design/ui/fluentui/fluenttextfield.dart';
import 'package:fluent_ui_design/ui/fluentui/fluentuimodels.dart';
import 'package:fluent_ui_design/ui/fluentui/fluentdialog.dart' as Dialog;
import 'package:fluent_ui_design/ui/widgets/drawer.dart';
import 'package:fluent_ui_design/ui/widgets/navigationappbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  TextStyle titleStyle = new TextStyle(color: Colors.black, fontSize: 25);
  TextEditingController sampleController = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<CommandBarButtonModel> popUpButtons = [
    new CommandBarButtonModel("title 1", Icons.toggle_off_rounded, () {}),
    new CommandBarButtonModel("title 2", Icons.upload_outlined, () {}),
    new CommandBarButtonModel("title 3", Icons.west, () {}),
  ];

  Padding subject(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Text(title, style: TextStyle(color: Colors.black, fontSize: 21)),
    );
  }

  Container detailTile(String title, double height, List<Widget> elements) {
    return Container(
      margin: const EdgeInsets.all(25),
      color: Colors.grey[200],
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: titleStyle,
                ),
              )),
          Expanded(
              flex: 8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: elements)),
        ],
      ),
    );
  }

  Container body(BuildContext context) {
    return Container(
      child: Scrollbar(
        isAlwaysShown: true,
        child: ListView(
          children: [
            detailTile("Buttons", 700, [
              subject("Default Button"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  DefaultButton("Primary"),
                  SizedBox(
                    width: 20,
                  ),
                  DefaultButton.standard("Standard"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              subject("Compound Button"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CompoundButton("Primary", "This is a secondary text."),
                  SizedBox(
                    width: 20,
                  ),
                  CompoundButton.standard(
                      "Standard", "This is a secondary text."),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              subject("Command Bar Button"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CommandBarButton("Primary", Icons.mail_outline),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CommandBarPopUpButton("Standard", popUpButtons),
                ],
              ),
              subject("Command Bar PopUp Button"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  SplitButton("Standard", popUpButtons),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  SplitButton("Longer Standard", popUpButtons),
                ],
              ),
              subject("Action Button"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  ActionButton("Standard", Icons.add_alarm),
                ],
              ),
            ]),
            detailTile("Text Fields", 450, [
              subject("Basic Text Field"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  BasicTextField("Standard", sampleController)
                ],
              ),
              subject("Basic Password Text Field"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  BasicTextField(
                    "Password",
                    sampleController,
                    obscureText: true,
                  )
                ],
              ),
              subject("Multiline Text Field"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  BasicTextField(
                    "Multiline Input",
                    sampleController,
                    multiline: true,
                  )
                ],
              ),
            ]),
            detailTile("Document Cards", 600, [
              subject("Default Document Card"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  DocumentCard("Large_File_Name.jpg", "Cercei", "Lannister")
                ],
              ),
              subject("Compact Document Card"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CompactDocumentCard(
                      "Large_File_Name.jpg", "Cercei", "Lannister")
                ],
              ),
            ]),
            detailTile("Panel", 100, [
              subject("Panel"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  DefaultButton.standard(
                    "Open Panel",
                    onPressed: () {
                      _scaffoldKey.currentState.openEndDrawer();
                      //Scaffold.of(context).openDrawer();
                    },
                  )
                ],
              ),
            ]),
            detailTile("Dialog", 100, [
              subject("Dialog"),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  DefaultButton.standard(
                    "Open Dialog",
                    onPressed: () {
                      Dialog.fluentDialog(context, "Fluent Dialog", Container(),
                          actions: []);
                      //_scaffoldKey.currentState.openEndDrawer();
                      //Scaffold.of(context).openDrawer();
                    },
                  )
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      // appBar: PreferredSize(
      //     preferredSize: const Size.fromHeight(60), child: NavigationAppbar()),
      drawer: NavigationDrawer(),
      endDrawer: new Panel(
        "Default Panel ",
        key: UniqueKey(),
        width: MediaQuery.of(context).size.width * 0.5,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicTextField("Eingabe", sampleController),
            SizedBox(
              height: 20,
            ),
            Text(
                "Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden. Und weil Sie nun schon die Güte haben, mich ein paar weitere Sätze lang zu begleiten, möchte ich diese Gelegenheit nutzen, Ihnen nicht nur als Lückenfüller zu dienen, sondern auf etwas hinzuweisen, das es ebenso verdient wahrgenommen zu werden: Webstandards nämlich. Sehen Sie, Webstandards sind das Regelwerk, auf dem Webseiten aufbauen. So gibt es Regeln für HTML, CSS, JavaScript oder auch XML; Worte, die Sie vielleicht schon einmal von Ihrem Entwickler gehört haben. Diese Standards sorgen dafür, dass alle Beteiligten aus einer Webseite den größten Nutzen ziehen. Im Gegensatz zu früheren Webseiten müssen wir zum Beispiel nicht mehr zwei verschiedene Webseiten für den Internet Explorer und einen anderen Browser programmieren. Es reicht eine Seite, die - richtig angelegt - sowohl auf verschiedenen Browsern im Netz funktioniert, aber ebenso gut für den Ausdruck oder"),
            SizedBox(
              height: 20,
            ),
            Text(
                "Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden. Und weil Sie nun schon die Güte haben, mich ein paar weitere Sätze lang zu begleiten, möchte ich diese Gelegenheit nutzen, Ihnen nicht nur als Lückenfüller zu dienen, sondern auf etwas hinzuweisen, das es ebenso verdient wahrgenommen zu werden: Webstandards nämlich. Sehen Sie, Webstandards sind das Regelwerk, auf dem Webseiten aufbauen. So gibt es Regeln für HTML, CSS, JavaScript oder auch XML; Worte, die Sie vielleicht schon einmal von Ihrem Entwickler gehört haben. Diese Standards sorgen dafür, dass alle Beteiligten aus einer Webseite den größten Nutzen ziehen. Im Gegensatz zu früheren Webseiten müssen wir zum Beispiel nicht mehr zwei verschiedene Webseiten für den Internet Explorer und einen anderen Browser programmieren. Es reicht eine Seite, die - richtig angelegt - sowohl auf verschiedenen Browsern im Netz funktioniert, aber ebenso gut für den Ausdruck oder"),
          ],
        ),
        footerLeft: DefaultButton("Save"),
      ),
      body: body(context),
    );
  }
}
