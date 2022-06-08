import 'package:flutter/material.dart';
import 'package:notes/pages/add_note_page/add_note_page.dart';
import 'package:notes/pages/notes_page/widgets/notes_body_widget.dart';
import 'package:notes/utils/app_bar_setting.dart';
import 'package:notes/utils/colors_rgb.dart';

import '../../domain/user.dart';
import '../../models/note.dart';
import '../../services/auth.dart';

class NotesPage extends StatefulWidget {
  static const routeName = '/notes';
  final List<Note> notes;
  final void Function() parentSetState;
  final Auth auth;
  final UserID user;

  const NotesPage(
      {Key? key,
      required this.notes,
      required this.parentSetState,
      required this.auth,
      required this.user})
      : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSetting.appBarNotes(
          auth: widget.auth, context: context, notes: widget.notes),
      body: NotesBodyWidget(
        notes: widget.notes,
        parentSetState: widget.parentSetState,
        user: widget.user,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNote(context),
        backgroundColor: ColorsRGB.floatingButtonColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNote(BuildContext context) {
    Navigator.pushNamed(context, AddNotePage.routeName);
  }
}
