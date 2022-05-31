import 'package:flutter/material.dart';

import '../../../models/note.dart';

class NotesBodyWidget extends StatelessWidget {
  const NotesBodyWidget({Key? key, required this.notes}) : super(key: key);
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: notes.length, itemBuilder: _buildItem);
  }

  Widget _buildItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          SizedBox(height: 4,),
          Text(notes[index].title),
          SizedBox(height: 4,),
          Text(notes[index].body),
          SizedBox(height: 4,),
        ],
      ),
    );
  }
}
