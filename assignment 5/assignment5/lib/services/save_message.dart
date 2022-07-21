import 'package:firebase_database/firebase_database.dart';

class SaveMessage {
  static Future<void> saveMessage(String firstId, String secondId, String message,
      String idMessage, int num) async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    var ref1 = database.ref('chats/$firstId$secondId/$num');
    await ref1.set({
      'message': message,
      'uid': idMessage,
    });
    var ref2 = database.ref('chats/$secondId$firstId/$num');
    await ref2.set({
      'message': message,
      'uid': idMessage,
    });

  }
}