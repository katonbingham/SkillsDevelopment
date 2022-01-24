import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:skill_dev/pages/home.dart';
import 'package:skill_dev/pages/loading.dart';
import 'package:skill_dev/pages/choose_location.dart';
import 'package:skill_dev/note_list.dart';

import 'edit.dart';
import '../note.dart';
import '../note_card.dart';
import '../note_list.dart';

/*
* Author: Katon Bingham
*
* Code Use Disclaimer:
* Loose format adapted from The Net Ninja's "Flutter For Beginners" video series
* https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ
* and from the docs.flutter.dev pages for relevant modules.
*/

void main() => runApp(MaterialApp(
  // home: NoteList(), // change later
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(), // home
      '/location': (context) => ChooseLocation(),
      '/edit': (context) => Edit(),
    },
  )
);




