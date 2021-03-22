import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double borderradius = 1.0;
  final bool border;

  final String title;
  final IconData icon;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;
  
  final BoxDecoration buttondecoration = new BoxDecoration(
    borderRadius: BorderRadius.circular(5),
  );

  DefaultButton(this.title, {Key key,  this.icon, this.onPressed, this.color = const Color.fromRGBO(0, 120, 212, 1), this.textColor = Colors.white, this.border = false, this.borderColor}) : super(key: key);

  DefaultButton.standard(this.title, {Key key,  this.icon, this.onPressed, this.color = Colors.white, this.textColor = const Color.fromRGBO(64, 63, 62, 1), this.border = true, this.borderColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius),
        border: ((){
          if(border){
            return Border.all(
              color: Colors.black,
              width: 0.5,
            );
          } 
        }()),
        color: color,
      ),
      child: new Material(
        child: new InkWell(
          onTap: onPressed != null? onPressed: () {},
          child: new Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null? Icon(icon, color: textColor,): Container(),
                Container(
                  margin: EdgeInsets.only(left: icon != null? 5: 0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3
                    ),
                  ),
                ),
              ],
            ),
            
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}

class CompoundButton extends StatelessWidget {
  final double borderradius = 1.0;
  final bool border;

  final String title;
  final String secondary;
  final Function onPressed;
  final Color color;
  final Color titleColor;
  final Color borderColor;
  final Color secondaryColor;
  
  final BoxDecoration buttondecoration = new BoxDecoration(
    borderRadius: BorderRadius.circular(5),
  );

  CompoundButton(this.title,  this.secondary, {Key key,  this.onPressed, this.color = const Color.fromRGBO(0, 120, 212, 1), this.titleColor = Colors.white, this.border = false, this.borderColor, this.secondaryColor = Colors.white}) : super(key: key);

  CompoundButton.standard(this.title, this.secondary, {Key key,   this.onPressed, this.color = Colors.white, this.titleColor = const Color.fromRGBO(94, 93, 93, 1), this.border = true, this.borderColor = Colors.black, this.secondaryColor = const Color.fromRGBO(64, 63, 62, 1)});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius),
        border: ((){
          if(border){
            return Border.all(
              color: Colors.black,
              width: 0.5,
            );
          } 
        }()),
        color: color,
      ),
      child: new Material(
        child: new InkWell(
          onTap: onPressed != null? onPressed: () {},
          child: new Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.5
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    secondary,
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 11,
                      letterSpacing: 0.3
                    ),
                  ),
                ),
              ],              
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}