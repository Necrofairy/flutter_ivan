import 'package:flutter/material.dart';
import 'package:notes/pages/edit_note_page/edit_note_page.dart';

import '../../../models/note.dart';

class NotesBodyWidget extends StatelessWidget {
  final List<Note> notes;
  final void Function() parentSetState;

  const NotesBodyWidget(
      {Key? key, required this.notes, required this.parentSetState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: notes.length, itemBuilder: _buildItem);
  }

  Widget _buildItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(notes[index].title),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(notes[index].body,),
                )),
                Column(
                  children: [
                    IconButton(onPressed: () => _edit(notes[index], context),
                        icon: const Icon(Icons.edit)),
                    IconButton(onPressed: () => _remove(notes[index]),
                        icon: const Icon(Icons.remove))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }

  void _remove(Note note) {
    if (notes.contains(note)) {
      int index = notes.indexOf(note);
      notes.removeAt(index);
      parentSetState();
    }
  }

  void _edit(Note note, BuildContext context) {
    Navigator.pushNamed(context, EditNotePage.routeName, arguments: note);
  }
}
