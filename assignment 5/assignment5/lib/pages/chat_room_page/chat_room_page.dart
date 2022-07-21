import 'package:assignment5/models/data_account.dart';
import 'package:assignment5/pages/chat_room_page/bloc/chat_room_bloc.dart';
import 'package:assignment5/pages/chat_room_page/widgets/chat_room_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({Key? key, required this.data})
      : super(key: key);
  static const routeName = '/chatroom';
  final DataAccount data;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    var account = settings.arguments as DataAccount;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${account.nickname}'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ChatRoomBloc(data: data, account: account),
        child: ChatRoomBodyWidget(
          account: account,
          data: data,
        ),
      ),
    );
  }
}
