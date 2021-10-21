import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: new List.generate(6, (index) => keyWidget(index + 1)),
            ),
        ),
      ),
    );
  }
}

void playSound(int noteNum) {
  final player = AudioCache();
  player.play('note$noteNum.wav');
}

MaterialColor getColor(int index) {
  switch (index) {
    case 1:
      return Colors.red;
      break;
    case 2:
      return Colors.orange;
      break;
    case 3:
      return Colors.yellow;
      break;
    case 4:
      return Colors.green;
      break;
    case 5:
      return Colors.teal;
      break;
    case 6:
      return Colors.blue;
      break;
    case 7:
      return Colors.purple;
      break;
    default:
      return Colors.white;
  }
}

Widget keyWidget(int index) {
  return Expanded(
    child: FlatButton(
      onPressed: () {
        playSound(index);
      },
      color: getColor(index),
    ),
  );
}
