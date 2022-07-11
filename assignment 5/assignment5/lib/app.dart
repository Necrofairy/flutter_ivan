import 'package:assignment5/pages/auth_page/auth_page.dart';
import 'package:assignment5/pages/auth_page/bloc/auth_bloc.dart';
import 'package:assignment5/pages/chat_room_page/chat_room_page.dart';
import 'package:assignment5/pages/registration_page/bloc/registration_bloc.dart';
import 'package:assignment5/pages/registration_page/registration_page.dart';
import 'package:assignment5/pages/selector_chat_room_page/selector_chat_room_page.dart';
import 'package:assignment5/services/auth.dart';
import 'package:assignment5/services/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/data_account.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Registration registration = Registration();
  Auth auth = Auth();
  DataAccount data =
      DataAccount(email: '', password: '', nickname: '', uid: '');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(auth: auth, data: data),
        ),
        BlocProvider(
          create: (context) =>
              RegistrationBloc(data: data, registration: registration),
        ),
      ],
      child: MaterialApp(
        initialRoute: AuthPage.routeName,
        routes: {
          AuthPage.routeName: (context) => AuthPage(
                data: data,
              ),
          RegistrationPage.routeName: (context) => RegistrationPage(
                data: data,
              ),
          ChatRoomPage.routeName: (context) => const ChatRoomPage(),
          SelectorChatRoomPage.routeName: (context) =>
              const SelectorChatRoomPage(),
        },
      ),
    );
  }
}
