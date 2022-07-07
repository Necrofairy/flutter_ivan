import 'package:assignment5/pages/registration_page/widgets/registration_body_widget.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static const routeName = '/registration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Form'),centerTitle:  true,),
      body: const RegistrationBodyWidget(),
    );
  }
}
