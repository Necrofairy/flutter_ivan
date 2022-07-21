class Message {
  final String message;
  final String uid;

  Message({required this.message, required this.uid});

  factory Message.fromJson(Map<String,dynamic> json) {
    return Message(message: json['message'], uid: json['uid']);
  }
}