import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      Bar()
    );

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: BallPage(),
      ),
    );
  }
}


class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {

  int ballFace = getBallFaceNum();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FlatButton(
              onPressed: (){
                print('Ball is pressed!');
                setState(() {
                  ballFace = getBallFaceNum();
                });
              },
              child: Image.asset('images/ball$ballFace.png'),
            ),
        )
      ],
    );
  }
}

int getBallFaceNum() {
  return Random().nextInt(5) + 1;
}
