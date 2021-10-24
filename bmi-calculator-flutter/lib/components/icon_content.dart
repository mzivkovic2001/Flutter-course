import 'package:flutter/material.dart';

import '../constants.dart';


class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.genderText});

  final IconData icon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(genderText, style: kLabelTextStyle,),
      ],
    );
  }
}