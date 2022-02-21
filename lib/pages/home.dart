import 'package:flutter/material.dart';
import 'package:skill_dev/database/database_provider.dart';
import 'package:skill_dev/pages/add_note.dart';

import '../models/note.dart';
import 'edit.dart';

/*
* This is the primary interface for the application. Populating the app with the
* list of notes is the primary function, and then directing the user to the
* correct page based on the gestures they use are secondary. Future iterations
* of this will include more modularization of the logic on this page, as well as
* a greater focus on the UI and aesthetic presentation of the data.
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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseProvider provider;

  @override
  void initState() {
    super.initState();
    provider = DatabaseProvider();
    provider.initializeDatabase().whenComplete(() async {
      await provider.getAllNotes();
      setState(() {});
    });
  }

  /* TODO: I would like to make the note cards collapse after the body text
      exceeds a certain length, rather than always displaying the full body. */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          key: const Key('appBar'),
          title: const Text('Skill Development Notes'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          automaticallyImplyLeading: false, // removes the back arrow
        ),

        body: FutureBuilder(
          // populate page with notes from the database
          future: provider.getAllNotes(),
          builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                key: const Key('noteListView'),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  var note = snapshot.data![index];
                  return GestureDetector(
                    // tap gesture to edit note
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Edit(note: note);
                          }));},
                    child: Dismissible(
                      // horizontal swipe gesture to delete note
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Icon(Icons.delete_forever_outlined),
                      ),
                      key: ValueKey<int>(snapshot.data![index].id!),
                      onDismissed: (DismissDirection direction) async {
                        await provider.deleteNote(snapshot.data![index].id!);
                        setState(() {
                          snapshot.data!.remove(snapshot.data![index]);
                        });
                      },
                      child: Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(snapshot.data![index].body),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          // Add Note button anchored to bottom right of screen
          key: const Key('addNoteButton'),
          onPressed: () {
            // "/add_note"
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const AddNote();
                }));
            },
          child: const Icon(Icons.note_add_outlined),
        )
    );
  }
}