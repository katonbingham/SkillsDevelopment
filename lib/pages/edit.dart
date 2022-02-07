import 'package:flutter/material.dart';
import '../models/note.dart';

/*
* Author: Katon Bingham
*
* Code Use Disclaimer:
* Loose format adapted from The Net Ninja's "Flutter For Beginners" video series
* https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ,
* Doctor Code's sqflite info:
* https://www.youtube.com/watch?v=RGa4HJutK48,
* and from the docs.flutter.dev pages for relevant modules
*/

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}
// this route needs to be passed data
// -> a card to edit

class _EditState extends State<Edit> {

  // temp implementation
  var note = Note(id: 1, title: 'title', body: 'text', origin: DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Editing...'),
      ),
      body: Column(
        children: <Widget>[
          Text(
          note.title,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            note.body,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[600],
            ),
          ),
        ]
      ),
    );
  }
}