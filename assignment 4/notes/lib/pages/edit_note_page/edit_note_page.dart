import 'package:flutter/material.dart';
import 'package:notes/pages/edit_note_page/widgets/edit_note_body_widget.dart';
import 'package:notes/utils/app_bar_setting.dart';
import 'package:notes/utils/colors_rgb.dart';

import '../../domain/user.dart';
import '../../models/note.dart';
import '../notes_page/notes_page.dart';

class EditNotePage extends StatefulWidget {
  static const routeName = '/edit_note';
  final void Function() setStateParent;
  final List<Note> notes;
  final UserID user;

  const EditNotePage(
      {Key? key,
      required this.notes,
      required this.setStateParent,
      required this.user})
      : super(key: key);

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Note;
    return Scaffold(
      appBar: AppBarSetting.appBarEditNote,
      body: SingleChildScrollView(
        child: EditNoteBodyWidget(
          notes: widget.notes,
          note: arguments,
          setStateParent: widget.setStateParent,
          titleController: titleController,
          bodyController: bodyController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _edit(arguments),
        backgroundColor: ColorsRGB.floatingButtonColor,
        child: const Icon(Icons.edit),
      ),
    );
  }

  void _edit(Note note) {
    List<Note> notes = widget.notes;
    if (titleController.text == '' || bodyController.text == '') {
      return;
    }
    if (notes.contains(note)) {
      int index = notes.indexOf(note);
      Note newNote = Note(
          title: titleController.text, body: bodyController.text, pos: note.pos);
      widget.user.editNote(note, newNote.title, newNote.body);
      notes[index] = newNote;
      widget.setStateParent();
      Navigator.pop(context);
    }
  }
}
