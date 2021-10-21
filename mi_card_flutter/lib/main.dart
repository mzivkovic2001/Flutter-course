import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50.0, backgroundImage: AssetImage('images/me.PNG')),
            Text(
              'Marin Zivkovic',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'FULL-STACK DEVELOPER',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                color: Colors.deepPurple[100],
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,width: 150.0,
            child: Divider(color: Colors.deepPurple.shade50,)),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.deepPurple.shade900,
                  ),
                  title: Text(
                    '+385 91 548 95 24',
                    style: TextStyle(
                        color: Colors.deepPurple.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0),
                  ),
                )
              ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.deepPurple.shade900,
                    ),
                    title: Text(
                      'mzivkovic@veleri.hr',
                      style: TextStyle(
                          color: Colors.deepPurple.shade900,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20.0),
                    ),
                  )),
          ],
        )),
      ),
    );
  }
}
