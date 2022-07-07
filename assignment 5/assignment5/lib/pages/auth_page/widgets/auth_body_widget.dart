import 'dart:collection';
import 'dart:convert';

import 'package:assignment5/pages/registration_page/registration_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../services/auth.dart';

class AuthBodyWidget extends StatefulWidget {
  const AuthBodyWidget({Key? key}) : super(key: key);

  @override
  State<AuthBodyWidget> createState() => _AuthBodyWidgetState();
}

class _AuthBodyWidgetState extends State<AuthBodyWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isActive = true;


  @override
  void initState() {
    super.initState();
    _emailController.text = 'test@gmail.com';
    _passwordController.text = 'testtest';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildEmailForm(),
        _buildIndent(indent: 10),
        _buildPasswordForm(),
        _buildIndent(indent: 20),
        _buildButtonConfirm(),
        _buildIndent(indent: 10),
        _buildRegisterButton(context),
      ],
    ));
  }

  Widget _buildIndent({required double indent}) {
    return SizedBox(
      height: indent,
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

  Widget _buildButtonConfirm() {
    return ElevatedButton(onPressed:isActive? () {_goChatRoom();}:null, child: const Text('Confirm'));
  }

  Widget _buildRegisterButton(BuildContext context) {
    return TextButton(
        onPressed:() {
          _goRegister(context);
        },
        child: const Text('Click to register'));
  }

  void _goChatRoom() async{
    isActive = false;
    setState((){});
    Auth auth = Auth();
    auth.logout();
    var auth2 = await auth.auth(_emailController.text, _passwordController.text);
    if (auth2?.user?.uid == null)  {
      await Future.delayed(const Duration(seconds: 2));
      isActive = true;
      setState((){});
      return;
    }
    FirebaseDatabase database = FirebaseDatabase.instance;
    var ref =  database.ref('accounts/${auth2?.user?.uid}');
    var snapshot = await ref.get();
    var json = jsonEncode(snapshot.value);
    Map<String, dynamic> map = jsonDecode(json);
    User user =  User.fromJson(map);
    var ref2 = database.ref('accounts/');
    var snapshot2 = await ref2.get();
    var json2 = jsonEncode(snapshot2.value);
    Map<String, dynamic> map2 = jsonDecode(json2);
    List<Map<String, dynamic>> list = [];
    map2.forEach((key, value) {
      list.add(value);
    });
    List<User> list2 = [];
    for(var user in list){
      list2.add(User.fromJson(user));
    }
    isActive = true;
    setState((){});
  }

  void _goRegister(BuildContext context) {
    Navigator.pushNamed(context, RegistrationPage.routeName);
  }
}
