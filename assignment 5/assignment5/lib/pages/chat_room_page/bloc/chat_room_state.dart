part of 'chat_room_bloc.dart';

@immutable
abstract class ChatRoomState {}

class ChatRoomInitial extends ChatRoomState {}

class ChatRoomDownload extends ChatRoomState{}

class ChatRoomFinish extends ChatRoomState{
  List<Message> messages;

  ChatRoomFinish({required this.messages});
}

class ChatRoomError extends ChatRoomState {
  Object  error;

  ChatRoomError({required this.error});
}
