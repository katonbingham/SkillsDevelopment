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

class Note {

  // ? operator guards access to potentially null data
  final int? id;
  final String title;
  final String body;
  final String origin;

  Note({
    this.id,
    required this.title,
    required this.body,
    required this.origin
      });

  // named constructor to handle data
  Note.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        body = res['body'],
        origin = res['origin'];

  // map a dynamic object to Note variables
  Map<String, Object?> toMap(){
    return({
      "id":id,
      "title":title,
      "body":body,
      "origin":origin
    });
  }
}