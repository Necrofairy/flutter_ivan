import 'package:flutter/material.dart';

import '../models/data_account.dart';
import '../pages/selector_chat_room_page/selector_chat_room_page.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key, required this.data}) : super(key: key);
  final DataAccount data;

  @override
  Widget build(BuildContext context) {
    return _buildOpenInfo(context);
  }

  Widget _buildOpenInfo(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${data.nickname} online!'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data.email),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, SelectorChatRoomPage.routeName);
                },
                child: const Text('Continue')),
          )
        ],
      ),
    );
  }
}
