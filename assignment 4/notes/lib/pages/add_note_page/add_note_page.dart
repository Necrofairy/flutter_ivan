import 'package:flutter/material.dart';
import 'package:notes/pages/add_note_page/widgets/add_note_body_widget.dart';
import 'package:notes/utils/app_bar_setting.dart';
import 'package:notes/utils/colors_rgb.dart';

import '../../models/note.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key, required this.notes, required this.parentSetState}) : super(key: key);
  static const routeName = '/add_notes';
  final List<Note> notes;
  final void Function() parentSetState;

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
      body: AddNoteBodyWidget(
        notes: widget.notes,
        titleController: titleController,
        bodyController: bodyController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNote(),
        backgroundColor: ColorsRGB.floatingButtonColor,
        child: const Icon(Icons.edit_outlined),
      ),
    );
  }

  void _addNote() {
    String title = titleController.text;
    String body = bodyController.text;
    if (title == '' || body == '') {
      return;
    }
    Note note = Note(title: title, body: body);
    widget.notes.add(note);
    titleController.text = '';
    bodyController.text = '';
    widget.parentSetState();
  }
}
