import 'package:flutter/material.dart';
import 'package:notes/pages/add_note_page/add_note_page.dart';
import 'package:notes/pages/notes_page/widgets/notes_body_widget.dart';
import 'package:notes/utils/app_bar_setting.dart';
import 'package:notes/utils/colors_rgb.dart';

import '../../models/note.dart';

class NotesPage extends StatelessWidget {
  static const routeName = '/notes';
  final List<Note> notes;
  final void Function() parentSetState;
  const NotesPage({Key? key, required this.notes, required this.parentSetState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSetting.appBarNotes,
      body: NotesBodyWidget(notes: notes, parentSetState: parentSetState,),
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
