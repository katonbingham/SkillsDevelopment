import 'package:flutter/material.dart';

/*
* This Loading page would ideally be used to pre-initialize information like the
* database and other helper objects. Currently it catches the user should they
* perform an unexpected action and provides a link back to the Home page.
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

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Loading'),
      ),
      body: Column(
      children: <Widget>[
        const Text('Root Loading screen'),
        TextButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, "/home");
            },
            icon: const Icon(Icons.keyboard_return),
            label: const Text('Return to notes'),
          ),
      ]
      )
    );
  }
}


