import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/auth_page/widgets/auth_body_widget.dart';
import 'package:notes/utils/app_bar_setting.dart';

import '../../domain/user.dart';
import '../../models/note.dart';
import '../../services/auth.dart';

class AuthPage extends StatelessWidget {
  static const routeName = '/auth';
  final List<Note> notes;
  final void Function() parentSetState;
  final UserID user;
  final Auth auth;

  const AuthPage(
      {Key? key,
      required this.notes,
      required this.parentSetState,
      required this.user,
      required this.auth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSetting.appBarAuth,
      body: SingleChildScrollView(
          child: AuthBodyWidget(
        notes: notes,
        user: user,
            auth: auth,
      )),
    );
  }
}
