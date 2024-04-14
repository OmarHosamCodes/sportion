// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sportion/library.dart';

class UserModel {
  final String id;
  final Timestamp createdAt;
  final String name;
  final String email;
  final String password;
  final String imageUrl;
  final double waterIntake;
  final double bmr;
  UserModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.waterIntake,
    required this.bmr,
  });

  UserModel copyWith({
    String? id,
    Timestamp? createdAt,
    String? name,
    String? email,
    String? password,
    String? imageUrl,
    double? waterIntake,
    double? bmr,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      waterIntake: waterIntake ?? this.waterIntake,
      bmr: bmr ?? this.bmr,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': imageUrl,
      'waterIntake': waterIntake,
      'bmr': bmr,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      createdAt: json['createdAt'],
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      imageUrl: json['imageUrl'] as String,
      waterIntake: json['waterIntake'] as double,
      bmr: json['bmr'] as double,
    );
  }

  UserModel.empty()
      : this(
          id: '',
          createdAt: Timestamp.now(),
          name: '',
          email: '',
          password: '',
          imageUrl: '',
          waterIntake: 0,
          bmr: 0,
        );

  @override
  String toString() {
    return 'UserModel(id: $id, createdAt: $createdAt, name: $name, email: $email, password: $password, imageUrl: $imageUrl, waterIntake: $waterIntake, bmr: $bmr)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdAt == createdAt &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.imageUrl == imageUrl &&
        other.waterIntake == waterIntake &&
        other.bmr == bmr;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        imageUrl.hashCode ^
        waterIntake.hashCode ^
        bmr.hashCode;
  }
}
