
import 'package:assignment5/pages/auth_page/widgets/auth_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/data_account.dart';
import '../../utils/texts.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key, required this.data}) : super(key: key);
  static const routeName = '/auth';
  final DataAccount data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Texts.auth),
        centerTitle: true,
      ),
      body: AuthBodyWidget(data: data,),
    );
  }
}
