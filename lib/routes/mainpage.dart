import 'package:fluent_ui_design/ui/fluentui/fluentbutton.dart';
import 'package:fluent_ui_design/ui/widgets/drawer.dart';
import 'package:fluent_ui_design/ui/widgets/navigationappbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  TextStyle titleStyle = new TextStyle(
    color: Colors.black,
    fontSize: 25
  );

  Padding subject (String title){
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25
        )
      ),
    );
  } 
    

  Container detailTile(String title){
    return Container(
      margin: const EdgeInsets.all(25),
      color: Colors.grey[300],
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: titleStyle,),
            )
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                subject("Default Button"),
                Row(
                  children: [                      
                    SizedBox(width: 20,),
                    DefaultButton("Primary"),
                    SizedBox(width: 20,),
                    DefaultButton.standard("Standard"),
                  ],
                ),
                SizedBox(height: 20,),
                subject("Compound Button"),
                Row(
                  children: [                      
                    SizedBox(width: 20,),
                    CompoundButton("Primary", "This is a secondary text."),
                    SizedBox(width: 20,),
                    CompoundButton.standard("Standard", "This is a secondary text."),
                  ],
                ),
                SizedBox(height: 20,),
                subject("Command Bar Button"),
                Row(
                  children: [                      
                    SizedBox(width: 20,),
                    CommandBarButton("Primary", Icons.mail_outline),
                  ],
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  Container body(){
    return Container(
      child: Scrollbar(
        isAlwaysShown: true,
        child: ListView(
          children: [
            detailTile("Buttons")
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: NavigationAppbar()
      ),
      drawer: NavigationDrawer(),
      body: body(),
    );
  }
}