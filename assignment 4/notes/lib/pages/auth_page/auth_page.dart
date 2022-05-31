import 'package:flutter/material.dart';
import 'package:notes/pages/auth_page/widgets/auth_body_widget.dart';
import 'package:notes/utils/app_bar_setting.dart';

import '../../models/note.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key, required this.notes, required  this.parentSetState}) : super(key: key);
  static const routeName = '/auth';
  final List<Note> notes;
  final void Function() parentSetState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSetting.appBarAuth,
      body: AuthBodyWidget(notes: notes),
    );
  }
}
