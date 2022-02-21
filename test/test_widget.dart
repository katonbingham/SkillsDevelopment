import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skill_dev/pages/home.dart';
/*
* This is the widget test module for the application
* Development stalled, unfortunately, and ran into the time allotted for testing.
* The testing is unfinished, and this poses a problem to the release of the app.
* Author: Katon Bingham
*/

void main(){
  NavigatorObserver _navObserver = NavigatorObserver();

  // define a test
  testWidgets('Notes has a title and message', (WidgetTester tester) async {
    // execute test
    await tester.pumpWidget(const MaterialApp(home: Home()));
    // check output
    expect(find.text('Skill Development Notes'), findsOneWidget);
  });


  testWidgets('navigate to /add_note', (WidgetTester tester) async {
    var isPushed = false;
    await tester.pumpWidget(const MaterialApp(home: Home()));




  });

  // TODO figure out how to test page transitions in flutter
  // testWidgets('Add a new note', (WidgetTester tester) async {
  //   // find widgets needed
  //   final addButton = find.byKey(const ValueKey("addNoteButton"));
  //   final titleField = find.byKey(const ValueKey("titleField"));
  //   final bodyField = find.byKey(const ValueKey("bodyField"));
  //   final submitButton = find.byKey(const ValueKey("submitNoteButton"));
  //
  //   // execute test
  //   await tester.pumpWidget(const MaterialApp(home: Home()));
  //   // await tester.tap(addButton);
  //   // await tester.tap(titleField);
  //   await tester.enterText(titleField, 'Tester text');
  //   await tester.enterText(bodyField, 'Tester body lorem ipsum dolor est');
  //   await tester.tap(submitButton);
  //
  //   // check output
  //   expect(find.text('Tester text'), findsOneWidget);
  //
  // });
}