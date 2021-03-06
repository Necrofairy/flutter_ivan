import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/domain/user.dart';
import 'package:notes/pages/notes_page/notes_page.dart';
import 'package:notes/utils/buttons_style.dart';
import 'package:notes/utils/text_field_decoration.dart';

import '../../../models/note.dart';
import '../../../services/auth.dart';
import '../../../utils/images_name.dart';

class AuthBodyWidget extends StatefulWidget {
  final List<Note> notes;
  final UserID user;
  final Auth auth;

  const AuthBodyWidget(
      {Key? key, required this.notes, required this.user, required this.auth})
      : super(key: key);

  @override
  State<AuthBodyWidget> createState() => _AuthBodyWidgetState();
}

class _AuthBodyWidgetState extends State<AuthBodyWidget> {
  var passwordController = TextEditingController();
  var loginController = TextEditingController();
  bool isRegisterAccess = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _loginField(),
          _passwordField(),
          isRegisterAccess ? _button() : _passiveButton(),
          _informationText(),
          isRegisterAccess ? _googleSignInButton() : _googlePassiveButton(),
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
        child: ElevatedButton(
            style: ButtonsStyle.confirmButton,
            onPressed: () =>
                _signIn(loginController.text, passwordController.text),
            child: const Text('Confirm')));
  }

  Widget _passiveButton() {
    return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: ElevatedButton(
            style: ButtonsStyle.confirmButton,
            onPressed: null,
            child: const Text('Confirm')));
  }

  Widget _informationText() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Don\'t have an account? Click to'),
          TextButton(onPressed: () {}, child: const Text('register!'))
        ],
      ),
    );
  }

  Widget _googleSignInButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonsStyle.googleButton,
        onPressed: () => _googleSignIn(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagesName.logo,
            ),
            const Text('Click to google register!')
          ],
        ),
      ),
    );
  }

  Widget _googlePassiveButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonsStyle.googleButton,
        onPressed: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagesName.logo,
            ),
            const Text('Click to google register!')
          ],
        ),
      ),
    );
  }

  void _signIn(String email, String password) {
    isRegisterAccess = false;
    setState(() {});
    Navigator.pushNamed(context, NotesPage.routeName);
    isRegisterAccess = true;
    setState(() {});
  }

  void _googleSignIn() {
    isRegisterAccess = false;
    setState(() {});
    var future = widget.auth.signInWithGoogle();
    future.then((value) {
      widget.user.setID(value.user?.uid ?? '');
      Future<List<Note>> note = widget.user.getNote();
      note.then((value){
        widget.notes.addAll(value);
        return Navigator.pushNamed(context, NotesPage.routeName);
      });
    });
    isRegisterAccess = true;
    setState(() {});
  }
}
