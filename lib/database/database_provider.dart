/*
* sqflite database provider class
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
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';

class DatabaseProvider {
  // underscore makes constructor private to the library and non-instantiable
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static late Database _database;

  // create getter for the database
  Future<Database> get database async {
    // do we have a db?
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async{
    return await openDatabase(join(await getDatabasesPath(), "skill_dev.db"),
      onCreate: (db, version) async {
      // create first table
      await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT
        body TEXT
        origin DATE
      )
      ''');
      }, version: 1);
  }
  
  addNewNote(Note note) async {
    final db = await database;
    // ConflictAlgorithm.replace will replace any existing table data with the insert() data
    db.insert("notes", note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // return all elements in "notes" table
  Future<dynamic> getNotes() async {
    final db = await database;
    var result = await db.query("notes");
    if (result.length == 0) {
      return Null;
    } else {
      var resultMap = result.toList();
      // condition ? ifTrue : ifFalse
      return resultMap.isNotEmpty ? resultMap : Null;
    }

  }

}