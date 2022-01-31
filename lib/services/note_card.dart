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

class NoteCard extends StatelessWidget {

  final Note note;
  final Function delete;
  final Function edit;

  NoteCard({ required this.note, required this.edit, required this.delete });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
          TextButton.icon(
              onPressed: (){delete();},
              icon: const Icon(Icons.delete),
              label: const Text('Delete Note')
          ),
          TextButton.icon(
              onPressed: (){edit();},
              icon: const Icon(Icons.edit),
              label: const Text('Edit Note')
          ),
          ],
        ),
      ),
    );
  }
}