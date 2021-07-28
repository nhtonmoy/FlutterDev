import 'package:flutter/material.dart';
import '../constants.dart';


class GenderCard extends StatelessWidget {
  final IconData iconData;
  final String cardText;

  GenderCard({this.iconData, this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
