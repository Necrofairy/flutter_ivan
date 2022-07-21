import 'package:assignment5/pages/selector_chat_room_page/widgets/selector_body_widget.dart';
import 'package:flutter/material.dart';

import '../../models/data_account.dart';

class SelectorChatRoomPage extends StatelessWidget {
  const SelectorChatRoomPage({Key? key, required this.data}) : super(key: key);
  static const routeName = '/selector';
  final DataAccount data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Choice chat:'),
      centerTitle: true,
    ),
    body:  SelectorBodyWidget(data: data,),);
  }
}
