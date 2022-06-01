import 'package:flutter/material.dart';

import '../../../models/note.dart';
import '../../../utils/text_field_decoration.dart';

class EditNoteBodyWidget extends StatelessWidget {
  final void Function() setStateParent;
  final List<Note> notes;
  final Note note;
  final TextEditingController titleController;
  final TextEditingController bodyController;

  const EditNoteBodyWidget(
      {Key? key,
      required this.notes,
      required this.note,
      required this.setStateParent,
      required this.titleController,
      required this.bodyController})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    bodyController.text = note.body;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _titleTextField(),
          _bodyTextField(),
        ],
      ),
    );
  }

  Widget _titleTextField() {
    return TextFormField(
      controller: titleController,
      decoration: TextFieldDecoration.titleFieldDecoration(titleController),
    );
  }

  Widget _bodyTextField() {
    return TextFormField(
        maxLines: 1,
        controller: bodyController,
        decoration: TextFieldDecoration.bodyFieldDecoration(bodyController));
  }
}
