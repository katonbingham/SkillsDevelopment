import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:skill_dev/database/database_provider.dart';
import 'package:skill_dev/models/unused_note_list.dart';

import 'edit.dart';
import 'package:skill_dev/database/database_provider.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Skill Development Notes'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),

        body: FutureBuilder(
          future: provider.getAllNotes(), // double-check this does the right thing
          builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot){
            if (snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
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
                    );
                  },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),

        //--------------------------------------------
        /*
        // FutureBuilder creates an asynchronous widget that will display when
        // the async calls are returned to it
        body: FutureBuilder(
          future: this.provider.getAllNotes(),
          builder: (context, noteData) {
            switch (noteData.connectionState) {
              case ConnectionState.none:
                {
                  return const Text('How did you get here?');
                }
            // if connection in progress, display loading indicator
              case ConnectionState.waiting:
                {
                  return const Center(child: CircularProgressIndicator());
                }
            // if connection is finished, evaluate results
              case ConnectionState.done:
                {
                  // if (noteData.hasError){
                  //   return Text('Error: ${noteData.error}');
                  // }

                  if (noteData.data == null) {
                    // if null, there are no notes - prompt user to make some
                    return const Center(
                      child: Text(
                          "No notes to display, log your first training session"),
                    );
                  } else { // if not null, display the formatted notes
                    return const Center(child: Text('the list'));
                    return Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: ListView.builder(

                        itemBuilder: (context, index) {
                          // set different items
                          String title = "title";
                          String body = "this is the body text";
                          String id = "1";
                          String origin = DateTime.now().toString();


                          // String title = "${noteData.data[index]['title']}";
                          // String body = noteData.data.[index]['body'];
                          // String id = noteData.data.[index]['id'];
                          // String origin = noteData.data.[index]['origin'];

                          // String title = noteData.data.

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
         */

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/add_note");
          },
          child: const Icon(Icons.note_add_outlined),
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