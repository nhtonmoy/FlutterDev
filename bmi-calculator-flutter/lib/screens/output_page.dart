import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

class OutputPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  OutputPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMIScoreTextStyle,
                  ),
                  Text(
                    interpretation.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: kBMIBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, '/');
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              color: kBottomCardColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'Re-Calculate',
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
