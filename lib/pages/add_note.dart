import 'package:flutter/material.dart';
import 'package:skill_dev/database/database_provider.dart';
import '../models/note.dart';

/*
* This page handles the logic to take user input for a new note, assign it to
* a Note object, and use the database handler to statefully store it.
*
* Author: Katon Bingham
*
* Code Use Disclaimer:
* Loose format adapted from The Net Ninja's "Flutter For Beginners" video series
* https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ,
* Doctor Code's sqflite info:
* https://www.youtube.com/watch?v=RGa4HJutK48,
* and from the docs.flutter.dev pages for relevant modules
*/

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote>{

  // database helper methods
  DatabaseProvider provider = DatabaseProvider();

  // input controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // temp data
    late String title;
    late String body;
    late String origin;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
      backgroundColor: Colors.blue[900],
      title: const Text('Add Note'),
    ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(
          children: [
            TextField(
              key: const Key('titleField'),
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title"
              ),
            ),
            Expanded(
                child: TextField(
                  key: const Key('bodyField'),
                  controller: bodyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "What have you been working on?"
                  ),
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          key: const Key('submitNoteButton'),
          onPressed: (){
          setState(() {
            // bind user input to the late initialized temp data defined above
            title = titleController.text;
            body = bodyController.text;
            origin = DateTime.now().toString();
          });

          // bind temp data to a Note object
          Note note = Note(title: title, body: body, origin: origin);
          // add Note object to a List of Notes object
          List<Note> listOfNotes = [note];
          // commit the note to the database
          provider.addNewNote(listOfNotes);

          // return to home page after note is added
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
        },
        label: const Text("Save"),
        icon: const Icon(Icons.save_outlined)
      ),
    );
  }
}
