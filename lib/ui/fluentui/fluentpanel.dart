import 'dart:io';

import 'package:fluent_ui_design/ui/fluentui/fluentbutton.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  double width;
  final double padding;
  final String panelTitle;
  final Column content;
  final Widget footerLeft;
  Widget footerRight;
  
  bool _setFooter = false;
  BuildContext _panelContext;

  Panel(
    this.panelTitle, 
    {
      Key key, 
      this.width = 350.0, 
      this.content, 
      this.padding = 20.0, 
      this.footerLeft, 
      this.footerRight,
    }
  ) : super(key: key);
  
  Row _header(BuildContext context){
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Text(
            panelTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => Navigator.of(_panelContext).pop(),
          )
        ),
      ],
    );
  }

  Container _body(){
    return Container(
      child: Scrollbar(
        controller: new ScrollController(),
        radius: Radius.zero,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(right: 10),
          child: content,
        ),
      ),
    );
  }

  Container _footer(){
    return Container(
      margin: EdgeInsets.only(top: padding / 2),
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          footerLeft ?? Container(),
          footerLeft != null? SizedBox(
            width: padding / 2,
          ): Container(),
          footerRight ?? Container()
        ],
      ),
    );
  }

  void _isMobile(){
    try{
        if(Platform.isAndroid||Platform.isIOS) {
            width = MediaQuery.of(_panelContext).size.width * 0.9;
        }
    } catch(e){
      width = width;
    }
  }

  @override
  Widget build(BuildContext context) {
    _panelContext = context;
    _isMobile();
    
    if(footerLeft != null) _setFooter = true;
    if(footerRight == null && _setFooter)
      footerRight =  DefaultButton.standard("Abbrechen", onPressed: () => Navigator.of(_panelContext).pop(),);
    return Container(
      padding: EdgeInsets.all(padding),
      color: Colors.white,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _header(context),
          Expanded(
            child: _body()
          ),
          _setFooter? 
            _footer():
            Container()
        ],
      ),
    );
  }
}