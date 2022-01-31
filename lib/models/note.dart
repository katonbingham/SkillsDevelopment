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

  int id;
  String title;
  String body;
  DateTime origin;

  Note(this.id, this.title, this.body, this.origin);

  // map a dynamic object to Note variables
  Map<String, dynamic> toMap(){
    return({
      "id":id,
      "title":title,
      "body":body,
      "origin":origin
    });
  }
}


// Note({required this.body, required this.title});
