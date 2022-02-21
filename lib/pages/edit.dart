import 'package:flutter/material.dart';
import 'package:skill_dev/database/database_provider.dart';
import '../models/note.dart';

/*
* This page is pushed a Note object from the Home page and the user is prompted
* to make the desired changes to each text field. When the submit action button
* is pressed, the user input is bound to a new Note object with the same ID as
* earlier and that replaces the entry in the database.
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

class Edit extends StatefulWidget {

  final Note? note;
  const Edit({Key? key, required this.note}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  // database helper methods
  DatabaseProvider provider = DatabaseProvider();

  // input controllers
  late TextEditingController titleController;
  late TextEditingController bodyController;

  // variables to edit
  late int? id;
  late String title;
  late String body;
  late String origin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Edit Note'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 8.0),
          TextFormField(
            controller: titleController = TextEditingController(text: widget.note?.title),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              labelStyle: TextStyle(
                color: Colors.black.withOpacity(0.3)
              ),
              labelText: 'Note Title',
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: bodyController = TextEditingController(text: widget.note?.body),
            maxLines: 12,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              labelStyle: TextStyle(
                color: Colors.black.withOpacity(0.3)
              ),
              labelText: 'Note Body',
              ),
            ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, push updated fields to db
        onPressed: (){
          setState(() {
            // bind user input to temp variables
            id = widget.note?.id;
            title = titleController.text;
            body = bodyController.text;
            origin = DateTime.now().toString();
          });

          // bind user input in temp variables to a Note object
          Note note = Note(id: id, title: title, body: body, origin: origin);
          // commit to database, conflicts resolve in favor of pushed object
          provider.editNote(note);

          // return to home page after note is added
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
          },
          child: const Icon(Icons.check)
      )
    );
  }
}