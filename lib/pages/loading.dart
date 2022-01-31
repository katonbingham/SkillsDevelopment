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

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // placeholder data
  // List<Note> notes = [
  //   Note(title: 'Day1', text: 'bar hop'),
  //   Note(title: "Tomorrow's work", text: 'matt xray alpha'),
  //   Note(title: 'Paul Bunyan', text: 'this is stage four')
  // ];
  //
  //
  // List<Note> notes = [
  //   Note(2, 'Day1', 'bar hop', DateTime.now()),
  //   Note(3, "Tomorrow's work", 'matt xray alpha', DateTime.now()),
  //   Note(4, 'Paul Bunyan', 'this is stage four', DateTime.now())
  // ];

  // // async call to db for list of notes, assign to local variables
  // void setupNoteList() async {
  //   // more temp data for instance
  //   Note instance = Note(3, "Tomorrow's work", 'matt xray alpha', DateTime.now());
  //
  //   print("printing instance: ");
  //   print(instance.title + instance.body);
  //
  //   // should I await.instance.someMethod() here?
  //   Navigator.pushReplacementNamed(context, '/home', arguments: {
  //     'title': instance.title,
  //     'text': instance.text,
  //   });
  //
  // }

  @override
  void initState() {
    super.initState();
    // setupNoteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Loading'),
      ),
      body: Column(
      children: <Widget>[
        const Text('Root Loading screen'),
        TextButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, "/home");
            },
            icon: const Icon(Icons.keyboard_return),
            label: const Text('Return to notes'),
          ),
      ]
      )
    );
  }
}


