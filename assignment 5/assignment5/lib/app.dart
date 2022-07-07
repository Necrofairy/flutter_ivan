import 'package:assignment5/pages/auth_page/auth_page.dart';
import 'package:assignment5/pages/chat_room_page/chat_room_page.dart';
import 'package:assignment5/pages/registration_page/registration_page.dart';
import 'package:assignment5/pages/selector_chat_room_page/selector_chat_room_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AuthPage.routeName,
      routes: {
        AuthPage.routeName: (context) => const AuthPage(),
        RegistrationPage.routeName: (context) => const RegistrationPage(),
        ChatRoomPage.routeName: (context) => const ChatRoomPage(),
        SelectorChatRoomPage.routeName: (context) => const SelectorChatRoomPage(),
      },
    );
  }
}
