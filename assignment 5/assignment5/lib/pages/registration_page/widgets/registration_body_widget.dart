
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../services/auth.dart';

class RegistrationBodyWidget extends StatefulWidget {
  const RegistrationBodyWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationBodyWidget> createState() => _RegistrationBodyWidgetState();
}

class _RegistrationBodyWidgetState extends State<RegistrationBodyWidget> {
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  bool isActive = true;

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildNameForm(),
        _buildIndent(indent: 10),
        _buildEmailForm(),
        _buildIndent(indent: 10),
        _buildPasswordForm(),
        _buildIndent(indent: 10),
        _buildRepeatPasswordForm(),
        _buildIndent(indent: 20),
        _buildButtonConfirm(context),
      ],
    ));
  }

  Widget _buildIndent({required double indent}) {
    return SizedBox(
      height: indent,
    );
  }

  Widget _buildNameForm() {
    return TextFormField(
      controller: _nicknameController,
      decoration: const InputDecoration(labelText: 'Nickname:'),
    );
  }

  Widget _buildEmailForm() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(labelText: 'Email:'),
    );
  }

  Widget _buildPasswordForm() {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(labelText: 'Password:'),
    );
  }

  Widget _buildRepeatPasswordForm() {
    return TextFormField(
      controller: _passwordRepeatController,
      decoration: const InputDecoration(labelText: 'Repeat password:'),
    );
  }

  Widget _buildButtonConfirm(BuildContext context) {
    return ElevatedButton(
        onPressed: isActive?() {
          _goChatRoom(context);
        }: null,
        child: const Text('Confirm'));
  }

  void _goChatRoom(BuildContext context) async  {
    isActive = false;
    setState((){});
    Auth auth = Auth();
    auth.logout();
    var registration = await auth.registration(_emailController.text, _passwordController.text);
    if (registration?.user?.uid == null) {
      await Future.delayed(const Duration(seconds: 2));
      isActive = true;
      setState((){});
      return;
    }
    FirebaseDatabase database = FirebaseDatabase.instance;
    var ref = database.ref('accounts/${registration?.user?.uid}');
    await ref.set({
      'nickname': _nicknameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'uid': registration?.user?.uid
    });
    isActive = true;
    Navigator.pop(context);
  }

}
