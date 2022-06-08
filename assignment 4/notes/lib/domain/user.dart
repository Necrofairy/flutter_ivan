import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/note.dart';

class UserID {
  late String _id;

  UserID.fromFirebase(User user) {
    _id = user.uid;
  }

  UserID.fromGoogle(GoogleSignInAccount account) {
    _id = account.id;
  }

  String get getID {
    return _id;
  }

  UserID(String id) : _id = id;

  void setID(String id) {
    _id = id;
  }

  void addNote(String title, String body, int pos, List<Note> notesList) {
    CollectionReference notes = FirebaseFirestore.instance.collection(_id);
    notes.doc('$pos').set({'title': title, 'body': body, 'pos': pos});
  }


  Future<List<Note>> getNote() async {
    List<Note> notes = [];
    var coll = await FirebaseFirestore.instance.collection(_id).get();
    var docs = coll.docs;
    for (var doc in docs) {
      Note note = Note.fromJSON(doc.data());
      notes.add(note);
    }
    return notes;
  }

  void deleteNote(Note note) async {
    CollectionReference notes = FirebaseFirestore.instance.collection(_id);
    var coll = await FirebaseFirestore.instance.collection(_id).get();
    var docs = coll.docs;
    for (var doc in docs) {
      Note noteInColl = Note.fromJSON(doc.data());
      if (noteInColl.title == note.title && noteInColl.body == note.body &&
          noteInColl.pos == note.pos) {
        notes.doc(doc.id).delete();
      }
    }
  }

  void editNote(Note note, String title, String body) async {
    CollectionReference notes = FirebaseFirestore.instance.collection(_id);
    var coll = await FirebaseFirestore.instance.collection(_id).get();
    var docs = coll.docs;
    for (var doc in docs) {
      Note noteInColl = Note.fromJSON(doc.data());
      if (noteInColl.title == note.title && noteInColl.body == note.body &&
          noteInColl.pos == note.pos) {
        notes.doc(doc.id).update({'title': title, 'body': body});
      }
    }
  }
}
