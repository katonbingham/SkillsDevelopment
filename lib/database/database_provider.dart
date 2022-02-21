import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';

/*
* SQFLite database provider class
* Author: Katon Bingham
*
* Code Use Disclaimer:
* Flutter SQFLite integration based on:
* https://petercoding.com/flutter/2021/03/21/using-sqlite-in-flutter/
* and from the docs.flutter.dev pages for relevant modules
*/


class DatabaseProvider {

  // initializes the database locally when called
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
      },  version: 1);
  }

  // add a new note to the database
  // returns # of successful insert operations
  Future<int> addNewNote(List<Note> notes) async {
    int result = 0;
    final Database db = await initializeDatabase();
    for(var note in notes){
      result = await db.insert('notes', note.toMap());
    }
    return result;
  }

  // deletes a note entry based on given ID
  Future<void> deleteNote(int id) async {
    final db = await initializeDatabase();
    await db.delete(
      'notes',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // overwrites a note entry with the note object passed to it
  // conflicts are resolved in the editNote object's favor
  Future<int> editNote(Note note) async {
    int result = 0;

    int? id = note.id;

    final db = await initializeDatabase();

    result = await db.update(
        'notes',
        note.toMap(),
        where: "id = ?",
        whereArgs: [note.id],
    );

    return result;
  }

  // returns all notes in database
  Future<List<Note>> getAllNotes() async {
    final Database db = await initializeDatabase();
    final List<Map<String, Object?>> queryResult = await db.query('notes');
    return queryResult.map((e) => Note.fromMap(e)).toList();
  }

  // closes database
  Future clearAllNotes() async {
    final db = await initializeDatabase();
    await db.close();
  }

}