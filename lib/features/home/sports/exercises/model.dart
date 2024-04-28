// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Exercise {
  String bodyPart;
  String equipment;
  String gifUrl;
  String id;
  String name;
  String target;
  List<dynamic> secondaryMuscles;
  List<dynamic> instructions;
  Exercise({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
    required this.secondaryMuscles,
    required this.instructions,
  });

  Exercise copyWith({
    String? bodyPart,
    String? equipment,
    String? gifUrl,
    String? id,
    String? name,
    String? target,
    List<dynamic>? secondaryMuscles,
    List<dynamic>? instructions,
  }) {
    return Exercise(
      bodyPart: bodyPart ?? this.bodyPart,
      equipment: equipment ?? this.equipment,
      gifUrl: gifUrl ?? this.gifUrl,
      id: id ?? this.id,
      name: name ?? this.name,
      target: target ?? this.target,
      secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bodyPart': bodyPart,
      'equipment': equipment,
      'gifUrl': gifUrl,
      'id': id,
      'name': name,
      'target': target,
      'secondaryMuscles': secondaryMuscles,
      'instructions': instructions,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
        bodyPart: map['bodyPart'] as String,
        equipment: map['equipment'] as String,
        gifUrl: map['gifUrl'] as String,
        id: map['id'] as String,
        name: map['name'] as String,
        target: map['target'] as String,
        secondaryMuscles:
            List<dynamic>.from((map['secondaryMuscles'] as List<dynamic>)),
        instructions: List<dynamic>.from(
          (map['instructions'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Exercise.fromJson(String source) =>
      Exercise.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Exercise(bodyPart: $bodyPart, equipment: $equipment, gifUrl: $gifUrl, id: $id, name: $name, target: $target, secondaryMuscles: $secondaryMuscles, instructions: $instructions)';
  }

  @override
  bool operator ==(covariant Exercise other) {
    if (identical(this, other)) return true;

    return other.bodyPart == bodyPart &&
        other.equipment == equipment &&
        other.gifUrl == gifUrl &&
        other.id == id &&
        other.name == name &&
        other.target == target &&
        listEquals(other.secondaryMuscles, secondaryMuscles) &&
        listEquals(other.instructions, instructions);
  }

  @override
  int get hashCode {
    return bodyPart.hashCode ^
        equipment.hashCode ^
        gifUrl.hashCode ^
        id.hashCode ^
        name.hashCode ^
        target.hashCode ^
        secondaryMuscles.hashCode ^
        instructions.hashCode;
  }
}
