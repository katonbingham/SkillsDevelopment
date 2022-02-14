import 'package:flutter/material.dart';
import 'package:skill_dev/database/database_provider.dart';
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

class AddNote extends StatefulWidget {
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
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title"
              ),
            ),
            Expanded(
                child: TextField(
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
        onPressed: (){
          setState(() {
            title = titleController.text;
            body = bodyController.text;
            origin = DateTime.now().toString();
          });
          // Note note = Note(title: title, body: body, origin: origin);
          Note note = Note(title: title, body: body, origin: origin);

          List<Note> listOfNotes = [note];
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
