import 'package:flutter/material.dart';
import 'package:skill_dev/database/database_provider.dart';
import 'package:skill_dev/models/unused_note_list.dart';

import 'edit.dart';
import '../models/note.dart';
import '../services/note_card.dart';
import '../models/unused_note_list.dart';

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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // retrieve all notes from the database
  getNotes() async{
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }


  @override
  Widget build(BuildContext context) {
    // previous stateful implementation
    // data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Skill Development Notes'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
      body: FutureBuilder(
        future: getNotes(),
        builder: (context, noteData) {
          switch (noteData.connectionState) {
            // if connection in progress, display loading indicator
            case ConnectionState.waiting:
              {
                return const Center(child: CircularProgressIndicator());
              }
            // if connection is finished, evaluate results
            case ConnectionState.done:
              {
                // if null, there are no notes - prompt user to make some
                if (noteData.data == Null) {
                  return const Center(
                    child: Text("No notes to display, log your first training session"),
                  );
                } else {  // if not null, display the formatted notes
                  // return const Center(child: Text('the list'));
                  return Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: ListView.builder(
                      // null safety in Dart causing me issues with .length
                      // I believe this method does not exist anymore?
                      // itemCount: noteData.data.length,

                      itemBuilder: (context, index){

                        // set different items
                        // if (noteData != null) {String title = (noteData.data as dynamic)[index]['title'];}

                        String title = "title";
                        String body = "this is the body text";
                        String id = "1";
                        String origin = DateTime.now().toString();


                        /* !! this implementation does not work currently, I need
                        * to solve how to async/late assign the dynamic object
                        * noteData actual data - Flutter 2.0.2 changed how nullable
                        * conditions are handled.
                        */

                        // String body = (noteData.data.[index]['body'];
                        // String id = (noteData.data as dynamic)[index]['id'];
                        // String origin = (noteData.data as dynamic)[index]['origin'];


                        // 'as dynamic' is an attempted fix for null-safe Dart requirements
                        //  didn't work, allowed null call
                        // String title = (noteData.data as dynamic)[index]['title'];
                        // String body = (noteData.data as dynamic)[index]['body'];
                        // String id = (noteData.data as dynamic)[index]['id'];
                        // String origin = (noteData.data as dynamic)[index]['origin'];


                        return Card(
                          child: ListTile(
                            title: Text(title),
                            subtitle: Text(body),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
          }
            // addresses FutureBuilder null safety requirement
            throw '';
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "/add_note");
        },
        child: Icon(Icons.note_add_outlined),
      )
    );
  }
}




// body: SafeArea(
// child: GridView.count(
// crossAxisCount: 2,
// crossAxisCount: 1,

// previous formatting
// children: notes.map((note) => NoteCard(
//   note: note,
//   edit: (){
//     TextButton.icon( // doesn't have an effect currently
//       onPressed: (){Navigator.pushNamed(context, '/edit', arguments: {
//         'title': instance.title,
//         'text': instance.text,
//       });},
//       icon: Icon(Icons.edit),
//       label: Text('Edit Note'),
//     );
//   },
//   delete: (){
//     setState(() {
//       // notes.remove(note);
//     });
//   }
// )).toList(),
// ),
// ),