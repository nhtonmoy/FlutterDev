import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;
  int answerNumber = 0;
  List<Icon> scoreKeeper = [];
  int countScore = 0;
  int totalQuestions = quizBrain.getQuestionsLength();

  _onBasicAlertPressed(context){
    Alert(
      style: AlertStyle(
        isOverlayTapDismiss: false,
        isCloseButton: false
      ),
      context: context,
      type: AlertType.info,
      title: 'Your Score: $countScore/$totalQuestions',
      desc: 'You have reached the end of the Quiz!!',
      buttons: [
        DialogButton(
          child: Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => resetQuiz(),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ]
    ).show();
  }

  void resetQuiz(){

    setState(() {
      answerNumber = 0;
      quizBrain.setQuestionNumberToZero();
      scoreKeeper = [];
      countScore = 0;
      Navigator.pop(context);
    });

  }

  void scoring(bool score) {
    if (answerNumber < quizBrain.getQuestionsLength()) {
      answerNumber++;
      setState(() {
        keepScore(score);
        quizBrain.nextQuestion();
      });
    }
    else {
      _onBasicAlertPressed(context);
    }
  }

  void keepScore(bool score) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    if (score == correctAnswer) {
      countScore++;
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else if (score != correctAnswer) {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                scoring(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                scoring(false);
                // setState(() {
                //   scoreKeeper.add(
                //       Icon(
                //         Icons.close, color: Colors.red,
                //       )
                //   );
                // });
              },
            ),
          ),
        ),
        Expanded(child: Row(children: scoreKeeper))

      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
