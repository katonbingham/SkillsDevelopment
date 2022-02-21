import 'package:flutter/material.dart';
import 'package:skill_dev/pages/home.dart';
import 'package:skill_dev/pages/loading.dart';

import 'pages/edit.dart';
import 'pages/add_note.dart';

/*
* Main holds the named routes for the application
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

// list of named routes
void main() => runApp(MaterialApp(
   initialRoute: '/home',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/edit': (context) => const Edit(note: null),
      '/add_note': (context) => const AddNote(),
    },
  )
);