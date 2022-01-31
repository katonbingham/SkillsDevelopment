// import 'package:flutter/material.dart';
//
// import '../note.dart';
// import '../note_card.dart';
//
// /*
// * Author: Katon Bingham
// *
// * Code Use Disclaimer:
// * Loose format adapted from The Net Ninja's "Flutter For Beginners" video series
// * https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ
// * and from the docs.flutter.dev pages for relevant modules.
// */
//
// /*
// * Currently unused, will likely refactor later.
// */
//
// class NoteList extends StatefulWidget {
//   @override
//   _NoteListState createState() => _NoteListState();
// }
//
//
// class _NoteListState extends State<NoteList> {
//
//   List<Note> notes = [
//     Note(title: 'Day1', text: 'bar hop'),
//     Note(title: "Tomorrow's work", text: 'matt xray alpha'),
//     Note(title: 'Paul Bunyan', text: 'this is stage four')
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: const Text('Skill Development'),
//         centerTitle: true,
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: Column(
//         children: notes.map((note) => NoteCard(
//             note: note,
//             edit: (){},
//             delete: (){
//               setState(() {
//                 notes.remove(note);
//               });
//             }
//         )).toList(),
//       )
//     );
//   }
// }