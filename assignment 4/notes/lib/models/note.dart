class Note {
  final String title;
  final String body;
  final int pos;

  Note({required this.title, required this.body, required this.pos});

  factory Note.fromJSON(Map<String, dynamic> json) {
    return Note(title: json['title'], body: json['body'], pos: json['pos']);
  }
}
