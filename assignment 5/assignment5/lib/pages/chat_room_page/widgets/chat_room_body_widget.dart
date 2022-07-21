import 'package:assignment5/models/data_account.dart';
import 'package:assignment5/pages/chat_room_page/bloc/chat_room_bloc.dart';
import 'package:assignment5/services/save_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/message.dart';

class ChatRoomBodyWidget extends StatefulWidget {
  const ChatRoomBodyWidget(
      {Key? key, required this.account, required this.data})
      : super(key: key);
  final DataAccount account;
  final DataAccount data;

  @override
  State<ChatRoomBodyWidget> createState() => _ChatRoomBodyWidgetState();
}

class _ChatRoomBodyWidgetState extends State<ChatRoomBodyWidget> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomBloc, ChatRoomState>(
      builder: (context, state) {
        if (state is ChatRoomInitial) {
          ChatRoomBloc bloc = BlocProvider.of<ChatRoomBloc>(context);
          bloc.add(ChatRoomSendEvent());
          return Container();
        } else if (state is ChatRoomDownload) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ChatRoomFinish) {
          return _buildChatRoom(context, state.messages);
        } else if (state is ChatRoomError) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildChatRoom(BuildContext context, List<Message> messages) {
    return ListView.builder(
        itemCount: messages.length + 1,
        itemBuilder: (context, index) {
          if (index == messages.length) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _messageController,
                onEditingComplete: () {
                  Message message = Message(
                      message: _messageController.text, uid: widget.data.uid);
                  SaveMessage.saveMessage(widget.data.uid, widget.account.uid,
                      message.message, widget.data.uid, messages.length + 1);
                  ChatRoomBloc bloc = BlocProvider.of<ChatRoomBloc>(context);
                  bloc.add(ChatRoomSendEvent());
                },
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Text(
                messages[index].message,
                textDirection: messages[index].uid != widget.data.uid
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
            ),
          );
        });
  }
}
