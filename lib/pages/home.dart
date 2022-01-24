import 'package:flutter/material.dart';
import 'package:skill_dev/note_list.dart';

import 'edit.dart';
import '../note.dart';
import '../note_card.dart';
import '../note_list.dart';

/*
* Author: Katon Bingham
*
* Code Use Disclaimer:
* Loose format adapted from The Net Ninja's "Flutter For Beginners" video series
* https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ
* and from the docs.flutter.dev pages for relevant modules.
*/

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // placeholder data
  List<Note> notes = [
    Note(title: 'Day1', text: 'bar hop'),
    Note(title: "Tomorrow's work", text: 'matt xray alpha'),
    Note(title: 'Paul Bunyan', text: 'this is stage four')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Skill Development Notes'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),

      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,

          children: notes.map((note) => NoteCard(
            note: note,
            edit: (){
              TextButton.icon( // doesn't have an effect currently
                onPressed: (){Navigator.pushNamed(context, '/edit');},
                icon: Icon(Icons.edit),
                label: Text('Edit Note'),
              );
            },
            delete: (){
              setState(() {
                notes.remove(note);
              });
            }
          )).toList(),
        ),
      ),
    );
  }
}