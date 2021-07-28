import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class BottomCards extends StatefulWidget {
  final int defaultVal;
  final String defaultText;

  BottomCards({this.defaultVal, @required this.defaultText});

  @override
  _BottomCardsState createState() => _BottomCardsState(defaultVal);
}

class _BottomCardsState extends State<BottomCards> {

  int _value;

  _BottomCardsState(this._value);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.defaultText,
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              _value.toString(),
              style: kNumberTextStyle,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 5.0),
              child: RoundIconButton(
                buttonText: FontAwesomeIcons.minus,
                onPressed: () {
                  setState(() {
                    _value = _value > 0
                        ? (_value) - 1
                        : _value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 5.0),
              child: RoundIconButton(
                buttonText: FontAwesomeIcons.plus,
                onPressed: () {
                  setState(() {
                    _value = _value + 1;
                  });
                },
              ),
              //   child: FloatingActionButton(
              //   child: Icon(
              //     FontAwesomeIcons.plus,
              //     color: Colors.white,
              //   ),
              //   backgroundColor: kLabelColor,
              //   onPressed: (){
              //     setState(() {
              //       widget.defaultVal = widget.defaultVal > 0 ? (widget.defaultVal)+1 : widget.defaultVal;
              //     });
              //   },
              // ),
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData buttonText;
  final Function onPressed;

  RoundIconButton({this.onPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      child: Icon(buttonText),
      shape: CircleBorder(),
      fillColor: kLabelColor,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      onPressed: onPressed,
    );
  }
}
