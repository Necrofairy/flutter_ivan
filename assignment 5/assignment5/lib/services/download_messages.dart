import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../models/message.dart';

class DownloadMessages {
  static Future<List<Message>> getMessages(String firstId, String secondId) async{
    List<Message> messages = [];
    FirebaseDatabase database = FirebaseDatabase.instance;
    var ref = database.ref('chats/$firstId$secondId');
    var snapshot = await ref.get();
    if (snapshot.value == null) {
      return messages;
    }
    var json = jsonEncode(snapshot.value);
    List<dynamic> list = jsonDecode(json);
    for(var v in list) {
      if (v == null)  {
        continue;
      }
      messages.add(Message.fromJson(v));
    }
    return messages;
  }
}