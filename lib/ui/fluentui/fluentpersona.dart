import 'package:flutter/material.dart';

class PersonaWithSecondaryText extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String secondaryText;

  const PersonaWithSecondaryText( this.firstName, this.lastName, this.secondaryText, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[600],
              radius: 15,
              child: Center(
                child: Text(
                  firstName[0].toUpperCase() + lastName[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$firstName $lastName",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12
                ),
              ),
              Text(
                "$secondaryText",
                style: TextStyle(
                  fontSize: 12
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}