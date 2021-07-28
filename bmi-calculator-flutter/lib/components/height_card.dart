import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/input_page.dart';


class HeightCard extends StatefulWidget {



  @override
  _HeightCardState createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  int _height = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'HEIGHT',
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              _height.toString(),
              style: kNumberTextStyle,
            ),
            Text(
              'cm',
              style: kLabelTextStyle,
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 10.0,
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 10.0,
            ),
            overlayColor: Color(0x29eb1555),
            thumbColor: kBottomCardColour,
            activeTrackColor: kBottomCardColour,
            inactiveTickMarkColor: kPrimaryColour,

            trackHeight: 1.5,
          ),
          child: Slider(
            value: _height.toDouble(),
            min: 80.0,
            max: 300.0,
            // activeColor: kBottomCardColour,
            // inactiveColor: kPrimaryColour,
            onChanged: (double value) {
              setState((){
                _height=value.round();
              });
            },
          ),
        )
      ],
    );
  }
}