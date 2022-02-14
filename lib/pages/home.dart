import 'package:flutter/material.dart';
import 'package:skill_dev/database/database_provider.dart';

import '../models/note.dart';
import 'edit.dart';

// import '../services/note_card.dart';
// import '../models/unused_note_list.dart';
// import 'package:skill_dev/models/unused_note_list.dart';
// import 'package:skill_dev/database/database_provider.dart';
// import 'dart:convert';

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

  /* TODO: I would like to make the note cards collapse after the body text
      exceeds a certain length, rather than always displaying the full body. */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Skill Development Notes'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          automaticallyImplyLeading: false, // removes the back arrow
        ),

        body: FutureBuilder(
          future: provider.getAllNotes(),
          builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  var note = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      // goToEditPage(note);
                      // print('gesture ontap');

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Edit(note: note);
                          }));},
                    child: Dismissible(
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
          onPressed: () {
            Navigator.pushNamed(context, "/add_note");
          },
          child: const Icon(Icons.note_add_outlined),
        )
    );
  }

  void goToEditPage(Note? note) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return Edit(note: note);
        }));
        // .then((valueFromTextField) {
      // use your valueFromTextField from the second page
    // });
  }
}


// pretty sure this is just a stateless implementation
// https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
// A Widget that extracts the necessary arguments from
// the ModalRoute.
// class ExtractArgumentsScreen extends StatelessWidget {
//   const ExtractArgumentsScreen({Key? key}) : super(key: key);
//
//   static const routeName = '/edit';
//
//   @override
//   Widget build(BuildContext context) {
//     // Extract the arguments from the current ModalRoute
//     // settings and cast them as ScreenArguments.
//     final args = ModalRoute.of(context)!.settings.arguments as Note;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(args.title),
//       ),
//       body: Center(
//         child:
//         Text(args.body),
//       ),
//     );
//   }
// }

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