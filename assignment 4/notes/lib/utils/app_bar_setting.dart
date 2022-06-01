import 'package:flutter/material.dart';
import 'package:notes/utils/colors_rgb.dart';
import 'package:notes/utils/texts_style.dart';

abstract class AppBarSetting {
  static final appBarAuth = AppBar(
    title: const Text(
      'Notes - auth',
      style: TextsStyle.bigText,
    ),
    centerTitle: true,
    backgroundColor: ColorsRGB.appBarColor,
  );
  static final appBarNotes = AppBar(
    title: const Text(
      'Notes',
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
}
