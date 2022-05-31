import 'package:flutter/material.dart';
import 'package:notes/utils/text_field_decoration.dart';

import '../../../models/note.dart';

class AddNoteBodyWidget extends StatelessWidget {
  final List<Note> notes;
  final TextEditingController titleController;
  final TextEditingController bodyController;
  const AddNoteBodyWidget(
      {Key? key,
      required this.notes,
      required this.titleController,
      required this.bodyController})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
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
