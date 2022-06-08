import 'package:flutter/material.dart';
import 'package:notes/pages/auth_page/auth_page.dart';
import 'package:notes/utils/colors_rgb.dart';
import 'package:notes/utils/texts_style.dart';

import '../models/note.dart';
import '../services/auth.dart';

abstract class AppBarSetting {
  static final appBarAuth = AppBar(
    title: const Text(
      'Notes - auth',
      style: TextsStyle.bigText,
    ),
    centerTitle: true,
    backgroundColor: ColorsRGB.appBarColor,
  );
  static final appBarAddNote = AppBar(
    title: const Text('Create new note:'),
    centerTitle: true,
    backgroundColor: ColorsRGB.appBarColor,
  );
  static final appBarEditNote = AppBar(
    title: const Text('Edit note:'),
    centerTitle: true,
    backgroundColor: ColorsRGB.appBarColor,
  );

  static AppBar appBarNotes({required Auth auth, required BuildContext context, required List<Note> notes}) {
    return AppBar(
      title: const Text(
        'Notes',
        style: TextsStyle.bigText,
      ),
      centerTitle: true,
      backgroundColor: ColorsRGB.appBarColor,
      leading: IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: () => _signOut(auth, context, notes),
      ),
    );
  }
  static void _signOut(Auth auth, BuildContext context, List<Note> notes) {
    auth.signOutGoogle();
    notes.clear();
    Navigator.pushNamedAndRemoveUntil(context, AuthPage.routeName, (route) => false);
  }
}
