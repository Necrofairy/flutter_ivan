import 'package:flutter/material.dart';
import 'package:notes/domain/user.dart';
import 'package:notes/pages/add_note_page/widgets/add_note_body_widget.dart';
import 'package:notes/utils/app_bar_setting.dart';
import 'package:notes/utils/colors_rgb.dart';

import '../../models/note.dart';

class AddNotePage extends StatefulWidget {
  static const routeName = '/add_note';
  final List<Note> notes;
  final void Function() parentSetState;
  final UserID user;

  const AddNotePage(
      {Key? key,
      required this.notes,
      required this.parentSetState,
      required this.user})
      : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSetting.appBarAddNote,
      body: SingleChildScrollView(
        child: AddNoteBodyWidget(
          notes: widget.notes,
          titleController: titleController,
          bodyController: bodyController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNote(),
        backgroundColor: ColorsRGB.floatingButtonColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNote() {
    String title = titleController.text;
    String body = bodyController.text;
    if (title == '' || body == '') {
      return;
    }
    Note note = Note(
        title: title,
        body: body,
        pos: widget.notes.isEmpty ? 0 : _calculatePos(widget.notes));
    widget.user.addNote(title, body, note.pos, widget.notes);
    widget.notes.add(note);
    titleController.text = '';
    bodyController.text = '';
    widget.parentSetState();
    Navigator.pop(context);
  }

  int _calculatePos(List<Note> notes) {
    int pos = 0;
    for (Note note in notes) {
      if (note.pos > pos) {
        pos = note.pos;
      }
    }
    pos++;
    return pos;
  }
}
