import 'package:flutter/material.dart';

class BasicTextField extends StatefulWidget {
  final double width;
  final String label;
  final String prefixText;
  final String placeholderText;
  final bool readOnly;
  final bool obscureText;
  final bool multiline;
  final TextEditingController controller;

  const BasicTextField(
    this.label, 
    this.controller,
    {
      Key key, 
      this.readOnly = false, 
      this.obscureText = false, 
      this.prefixText, 
      this.placeholderText, 
      this.width = 250.0, 
      this.multiline = false,
    }
  ) : super(key: key);

  @override
  _BasicTextFieldState createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  bool obscureText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 3.0),
          child: Text(widget.label),
        ),
        Container(
          width: widget.width,
          child: TextField(
            controller: widget.controller,
            readOnly: widget.readOnly,
            obscureText: obscureText,
            cursorColor: Colors.black,
            cursorWidth: 1,
            keyboardType:  widget.multiline && widget.obscureText == false? TextInputType.multiline: null,
            maxLines: widget.multiline && widget.obscureText == false? null: 1,
            style: TextStyle(
              fontSize: 15
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(9),
              hintText: widget.placeholderText,
              prefixText: widget.prefixText,
              suffix: widget.obscureText? Container(
                width: 30,
                alignment: Alignment.centerRight,
                child: IconButton(
                  iconSize: 15,
                  splashRadius: 15,
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                    maxHeight: 40,
                    minHeight: 30
                  ),
                  color: Colors.blue,
                  icon: Icon(obscureText? Icons.visibility_outlined: Icons.visibility_off_outlined),
                  onPressed: (){
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ):null,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 120, 212, 1), 
                  width: 1
                ),
                borderRadius: BorderRadius.circular(1.0)
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0)
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(164, 38, 44, 1), 
                  width: 1
                ),
                borderRadius: BorderRadius.circular(1.0)
              ),
            ),
          ),
        ),
      ],
    );
  }
}