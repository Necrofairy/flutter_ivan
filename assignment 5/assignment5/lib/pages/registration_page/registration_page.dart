import 'package:assignment5/pages/registration_page/widgets/registration_body_widget.dart';
import 'package:flutter/material.dart';

import '../../models/data_account.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key, required this.data}) : super(key: key);
  static const routeName = '/registration';
  final DataAccount  data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Form'),centerTitle:  true,),
      body:  RegistrationBodyWidget(data: data,),
    );
  }
}
