import 'package:assignment5/global_widgets/account_info.dart';
import 'package:assignment5/pages/registration_page/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/data_account.dart';

class RegistrationBodyWidget extends StatefulWidget {
  const RegistrationBodyWidget({Key? key, required this.data})
      : super(key: key);
  final DataAccount data;

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
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        if (state is  RegistrationInitial) {
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
        } else if (state is RegistrationDownload) {
          return const Center(child: CircularProgressIndicator(),);
        } else if (state is RegistrationError) {
          return const Center(child: Text('Error!'),);
        } else {
          return AccountInfo(data: widget.data);
        }
      },
    );
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
    RegistrationBloc registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    return ElevatedButton(
        onPressed: () {
          widget.data.nickname = _nicknameController.text;
          widget.data.password = _passwordController.text;
          widget.data.email = _emailController.text;
          registrationBloc.add(RegistrationConfirmEvent());
        },
        child: const Text('Confirm'));
  }
}
