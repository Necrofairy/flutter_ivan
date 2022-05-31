import 'package:flutter/material.dart';

abstract class TextFieldDecoration {
  static InputDecoration loginFieldDecoration(
      TextEditingController controller) {
    return InputDecoration(
        icon: const Icon(Icons.login),
        labelText: 'Login:',
        suffixIcon: InkWell(
            onTap: () => _delete(controller),
            child: const Icon(Icons.delete_outline)));
  }

  static InputDecoration passwordFieldDecoration(
      TextEditingController controller) {
    return InputDecoration(
        icon: const Icon(Icons.password),
        labelText: 'Password:',
        suffixIcon: InkWell(
            onTap: () => _delete(controller),
            child: const Icon(Icons.delete_outline)));
  }

  static InputDecoration titleFieldDecoration(
      TextEditingController controller) {
    return InputDecoration(
        labelText: 'Title:',
        suffixIcon: InkWell(
          onTap: () => _delete(controller),
          child: const Icon(Icons.delete_outline),
        ));
  }

  static InputDecoration bodyFieldDecoration(
      TextEditingController controller) {

    return InputDecoration(
        labelText: 'Body:',
        suffixIcon: InkWell(
          onTap: () => _delete(controller),
          child: const Icon(Icons.delete_outline),
        ));
  }

  static void _delete(TextEditingController controller) {
    controller.text = '';
  }
}
