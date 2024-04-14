// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sportion/library.dart';

class Post {
  final String id;
  final String body;
  final String author;
  final Timestamp date;
  final String? image;
  Post({
    required this.id,
    required this.body,
    required this.author,
    required this.date,
    this.image,
  });

  Post copyWith({
    String? id,
    String? body,
    String? author,
    Timestamp? date,
    String? image,
  }) {
    return Post(
      id: id ?? this.id,
      body: body ?? this.body,
      author: author ?? this.author,
      date: date ?? this.date,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'body': body,
      'author': author,
      'date': date,
      'image': image,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      body: map['body'] as String,
      author: map['author'] as String,
      date: map['date'],
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, body: $body, author: $author, date: $date, image: $image)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.body == body &&
        other.author == author &&
        other.date == date &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        body.hashCode ^
        author.hashCode ^
        date.hashCode ^
        image.hashCode;
  }
}
