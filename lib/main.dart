import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:skill_dev/pages/home.dart';
import 'package:skill_dev/pages/loading.dart';
import 'package:skill_dev/pages/choose_location.dart';
import 'package:skill_dev/models/unused_note_list.dart';

import 'models/note.dart';
import 'models/unused_note_list.dart';
import 'pages/edit.dart';
import 'pages/add_note.dart';
import 'services/note_card.dart';

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

void main() => runApp(MaterialApp(
  // home: NoteList(), // change later
    // initialRoute: '/home',

    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
      '/edit': (context) => Edit(),
      '/add_note': (context) => AddNote(),
    },
  )
);




