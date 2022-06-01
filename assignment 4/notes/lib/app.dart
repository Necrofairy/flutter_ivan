import 'package:flutter/material.dart';
import 'package:notes/pages/add_note_page/add_note_page.dart';
import 'package:notes/pages/auth_page/auth_page.dart';
import 'package:notes/pages/edit_note_page/edit_note_page.dart';
import 'package:notes/pages/notes_page/notes_page.dart';
import 'package:notes/utils/notes.dart';

import 'models/note.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    notes.addAll(Notes.notes);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AuthPage.routeName,
      routes: {
        AuthPage.routeName: (context) => AuthPage(
              notes: notes,
              parentSetState: () => setState(() {}),
            ),
        NotesPage.routeName: (context) => NotesPage(
              notes: notes,
              parentSetState: () => setState(() {}),
            ),
        AddNotePage.routeName: (context) => AddNotePage(
              notes: notes,
              parentSetState: () => setState(() {}),
            ),
        EditNotePage.routeName: (context) => EditNotePage(
              notes: notes,
              setStateParent: () => setState(() {}),
            )
      },
    );
  }
}
