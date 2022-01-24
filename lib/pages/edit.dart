import 'package:flutter/material.dart';
import '../note.dart';

/*
* Author: Katon Bingham
*
* Code Use Disclaimer:
* Loose format adapted from The Net Ninja's "Flutter For Beginners" video series
* https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ
* and from the docs.flutter.dev pages for relevant modules.
*/

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  // intended implementation
  // var note = Note(this.title, this.text);

  // temp implementation
  var note = Note(title: 'this.title', text: 'this.text');

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
            note.text,
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