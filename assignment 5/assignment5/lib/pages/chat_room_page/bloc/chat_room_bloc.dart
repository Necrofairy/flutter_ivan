import 'dart:async';

import 'package:assignment5/services/download_messages.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/data_account.dart';
import '../../../models/message.dart';

part 'chat_room_event.dart';

part 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final DataAccount data;
  final DataAccount account;

  ChatRoomBloc({required this.data, required this.account})
      : super(ChatRoomInitial()) {
    on<ChatRoomEvent>((event, emit) async {
      emit(ChatRoomDownload());
      try {
        List<Message> messages =
            await DownloadMessages.getMessages(data.uid, account.uid);
        emit(ChatRoomFinish(messages: messages));
      } catch (error) {
        emit(ChatRoomError(error: error));
      }
    });
  }
}
