import 'package:flutter/material.dart';
import 'package:notes/pages/notes_page/notes_page.dart';
import 'package:notes/utils/text_field_decoration.dart';

import '../../../models/note.dart';

class AuthBodyWidget extends StatefulWidget {
  final List<Note> notes;
  const AuthBodyWidget({Key? key, required this.notes}) : super(key: key);

  @override
  State<AuthBodyWidget> createState() => _AuthBodyWidgetState();
}

class _AuthBodyWidgetState extends State<AuthBodyWidget> {
  var passwordController = TextEditingController();
  var loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _loginField(),
          _passwordField(),
          _button(),
          _informationText(),
        ],
      ),
    );
  }

  Widget _loginField() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        child: TextFormField(
          controller: loginController,
          decoration: TextFieldDecoration.loginFieldDecoration(loginController),
        ));
  }

  Widget _passwordField() {
    return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: TextFormField(
          controller: passwordController,
          decoration:
              TextFieldDecoration.passwordFieldDecoration(passwordController),
        ));
  }

  Widget _button() {
    return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: ElevatedButton(onPressed: () =>  _moveNotes(), child: const Text('Confirm')));
  }

  void _moveNotes()  {
    Navigator.pushNamed(context, NotesPage.routeName);
  }

  Widget _informationText() {
    return Text('abcd');
  }
}
