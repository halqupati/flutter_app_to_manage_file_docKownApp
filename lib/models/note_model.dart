class Note {
  int? id;
  String? title;
  String? description;
  String? photo;

  Note({this.id, this.title, this.description, this.photo});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id:json['id'],
      title:json['title'],
      description:json['description'],
      photo:json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> note = <String, dynamic>{};
    note['id'] = id;
    note['title'] = title;
    note['photo'] = photo;
    note['description'] = description;
    return note;
  }

}
