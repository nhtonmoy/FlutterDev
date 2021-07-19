import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  void playSound(int a) {
    setState(() {
      final player = AudioCache();
      player.play('note$a.wav');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> buttonNumbers = [1, 2, 3, 4, 5, 6, 7];
    List<Widget> _getButtons() {
      List<Widget> widgets = new List<Widget>();
      for (int i = 1; i <= 7; i++) {
        widgets.add(new MaterialButton(
          color: i == 1
              ? Colors.purple
              : i == 2
                  ? Colors.blue
                  : i == 3
                      ? Colors.lightBlueAccent
                      : i == 4
                          ? Colors.green
                          : i == 5
                              ? Colors.yellow
                              : i == 6
                                  ? Colors.orange
                                  : Colors.red,
          onPressed: () {
            playSound(i);
          },
        ));
      }
      return widgets;
    }

    Widget buildKey(int key, Color col){

      return Expanded(
        child: MaterialButton(
          color: col,
          onPressed: () {
            playSound(key);
          },
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            buildKey(1, Colors.purple),
            buildKey(2, Colors.blue),
            buildKey(3, Colors.orange),
            buildKey(4, Colors.green),
            buildKey(5, Colors.yellow),
            buildKey(6, Colors.lightBlueAccent),
            buildKey(7, Colors.red),
          ],
          ),
        ),
      ),
    );
  }
}
