import 'package:flutter/material.dart';

/*
* Author: Katon Bingham
*
* Code Use Disclaimer:
* Loose format adapted from The Net Ninja's "Flutter For Beginners" video series
* https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ
* and from the docs.flutter.dev pages for relevant modules.
*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Loading'),
      ),
      body: Column(
      children: <Widget>[
        Text('Root Loading screen'),
        TextButton.icon(
            onPressed: (){Navigator.pushNamed(context, '/home');},
            icon: Icon(Icons.keyboard_return),
            label: Text('Return to notes'),
          ),
        ]
      )
    );
  }
}