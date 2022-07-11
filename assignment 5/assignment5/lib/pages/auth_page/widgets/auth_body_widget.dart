import 'package:assignment5/pages/auth_page/bloc/auth_event.dart';
import 'package:assignment5/pages/auth_page/bloc/auth_state.dart';
import 'package:assignment5/pages/registration_page/registration_page.dart';
import 'package:assignment5/pages/selector_chat_room_page/selector_chat_room_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global_widgets/account_info.dart';
import '../../../models/data_account.dart';
import '../bloc/auth_bloc.dart';

class AuthBodyWidget extends StatefulWidget {
  const AuthBodyWidget({Key? key, required this.data}) : super(key: key);
  final DataAccount data;

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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthMenuState) {
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
            ),
          );
        } else if (state is AuthGettingUserState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AuthErrorState) {
          return Center(
            child: Text('$AuthErrorState'),
          );
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
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return ElevatedButton(
        onPressed: () {
          widget.data.email = _emailController.text;
          widget.data.password = _passwordController.text;
          authBloc.add(AuthConfirmEvent());
        },
        child: const Text('Confirm'));
  }

  Widget _buildRegisterButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, RegistrationPage.routeName);
        },
        child: const Text('Click to register'));
  }
}
