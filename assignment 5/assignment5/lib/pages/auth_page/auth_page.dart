import 'package:assignment5/pages/auth_page/widgets/auth_body_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/texts.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Texts.auth), centerTitle: true,),
      body: const AuthBodyWidget(),
    );
  }
}
