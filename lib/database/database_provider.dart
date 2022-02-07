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

  // https://petercoding.com/flutter/2021/03/21/using-sqlite-in-flutter/
  Future<Database> initializeDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'skill_development.db'),
      onCreate: (database, version) async {
        await database.execute(
      "CREATE TABLE notes ("
        "id INTEGER PRIMARY KEY, "
        "title TEXT, "
        "body TEXT, "
        "origin DATETIME)"
        );
        // It is possible passing a string to the datetime sqlite column will err
        // so far so good, however.
      },  version: 1);
  }

  // https://petercoding.com/flutter/2021/03/21/using-sqlite-in-flutter/
  Future<int> addNewNote(List<Note> notes) async {
    int result = 0;
    final Database db = await initializeDatabase();
    for(var note in notes){
      result = await db.insert('notes', note.toMap());
    }
    return result;
  }

  // https://petercoding.com/flutter/2021/03/21/using-sqlite-in-flutter/
  Future<void> deleteNote(int id) async {
    final db = await initializeDatabase();
    await db.delete(
      'notes',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // https://petercoding.com/flutter/2021/03/21/using-sqlite-in-flutter/
  Future<List<Note>> getAllNotes() async {
    final Database db = await initializeDatabase();
    final List<Map<String, Object?>> queryResult = await db.query('notes');
    return queryResult.map((e) => Note.fromMap(e)).toList();
  }

  // previous implementation
  // ------------------------------------------------------------------------
  // underscore makes constructor private to the library and non-instantiable
  // DatabaseProvider._();
  // static final DatabaseProvider db = DatabaseProvider._();
  // static late Database _database;

  // create getter for the database
  // Future<Database> get database async {
  //   // do we have a db?
  //   if (_database != null) {
  //     return _database;
  //   }
  //
  //   _database = await initializeDatabase();
  //   return _database;
  // }

  // initDB() async{
  //   return await openDatabase(join(await getDatabasesPath(), "skill_dev.db"),
  //     onCreate: (db, version) async {
  //     // create first table
  //     await db.execute('''
  //     CREATE TABLE notes (
  //       id INTEGER PRIMARY KEY AUTOINCREMENT,
  //       title TEXT
  //       body TEXT
  //       origin DATE
  //     )
  //     ''');
  //     }, version: 1);
  // }

  // addNewNote(Note note) async {
  //   final db = await database;
  //   // ConflictAlgorithm.replace will replace any existing table data with the insert() data
  //   db.insert("notes", note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // return all elements in "notes" table
  // Future<dynamic> getNotes() async {
  //   final db = await database;
  //   var result = await db.query("notes");
  //   if (result.isEmpty) {
  //     return null;
  //   } else {
  //     var resultMap = result.toList();
  //     // condition ? ifTrue : ifFalse
  //     return resultMap.isNotEmpty ? resultMap : Null;
  //   }
  // }
}