

class Album {
  final int id;
  final String question;
  dynamic option= new List<String>();

  Album({this.id, this.question, this.option});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      question: json['Question'],
      option: List.of(json['Options']),
    );
  }
}