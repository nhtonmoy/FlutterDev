import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/output_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/enums.dart';
import '../components/bottom_card.dart';
import '../components/gender_card.dart';
import '../components/height_card.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: GenderCard(
                        cardText: 'MALE',
                        iconData: FontAwesomeIcons.mars,
                      ),
                      colour: selectedGender == Gender.Male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: GenderCard(
                        cardText: 'FEMALE',
                        iconData: FontAwesomeIcons.venus,
                      ),
                      colour: selectedGender == Gender.Female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kMiddleActiveCardColour,
                // cardChild: HeightCard(),
                cardChild: Column(
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
                          height.toString(),
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
                        value: height.toDouble(),
                        min: 80.0,
                        max: 300.0,
                        // activeColor: kBottomCardColour,
                        // inactiveColor: kPrimaryColour,
                        onChanged: (double value) {
                          setState((){
                            height=value.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      // cardChild: BottomCards(
                      //   defaultText: 'WEIGHT(KG)',
                      //   defaultVal: 60,
                      // ),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
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
                                      weight = weight > 0
                                          ? (weight) - 1
                                          : weight;
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
                                      weight = weight + 1;
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
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: BottomCards(
                        defaultText: 'AGE',
                        defaultVal: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) => OutputPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )));
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 20.0),
                color: kBottomCardColour,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
                child: Center(
                  child: Text(
                    'Calculate',
                    style: kLargeButtonTextStyle,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
