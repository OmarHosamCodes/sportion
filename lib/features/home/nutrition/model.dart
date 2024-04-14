// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Nutrition {
  String? name;
  double? calories;
  double? servingSizeG;
  double? fatTotalG;
  double? fatSaturatedG;
  int? proteinG;
  int? sodiumMg;
  int? potassiumMg;
  int? cholesterolMg;
  int? carbohydratesTotalG;
  int? fiberG;
  int? sugarG;
  Nutrition({
    this.name,
    this.calories,
    this.servingSizeG,
    this.fatTotalG,
    this.fatSaturatedG,
    this.proteinG,
    this.sodiumMg,
    this.potassiumMg,
    this.cholesterolMg,
    this.carbohydratesTotalG,
    this.fiberG,
    this.sugarG,
  });

  Nutrition copyWith({
    String? name,
    double? calories,
    double? servingSizeG,
    double? fatTotalG,
    double? fatSaturatedG,
    int? proteinG,
    int? sodiumMg,
    int? potassiumMg,
    int? cholesterolMg,
    int? carbohydratesTotalG,
    int? fiberG,
    int? sugarG,
  }) {
    return Nutrition(
      name: name ?? this.name,
      calories: calories ?? this.calories,
      servingSizeG: servingSizeG ?? this.servingSizeG,
      fatTotalG: fatTotalG ?? this.fatTotalG,
      fatSaturatedG: fatSaturatedG ?? this.fatSaturatedG,
      proteinG: proteinG ?? this.proteinG,
      sodiumMg: sodiumMg ?? this.sodiumMg,
      potassiumMg: potassiumMg ?? this.potassiumMg,
      cholesterolMg: cholesterolMg ?? this.cholesterolMg,
      carbohydratesTotalG: carbohydratesTotalG ?? this.carbohydratesTotalG,
      fiberG: fiberG ?? this.fiberG,
      sugarG: sugarG ?? this.sugarG,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'calories': calories,
      'serving_size_g': servingSizeG,
      'fat_total_g': fatTotalG,
      'fat_saturated_g': fatSaturatedG,
      'protein_g': proteinG,
      'sodium_mg': sodiumMg,
      'potassium_mg': potassiumMg,
      'cholesterol_mg': cholesterolMg,
      'carbohydrates_total_g': carbohydratesTotalG,
      'fiber_g': fiberG,
      'sugar_g': sugarG,
    };
  }

  factory Nutrition.fromMap(Map<String, dynamic> map) {
    return Nutrition(
      name: map['name'] as String?,
      calories: map['calories'] as double?,
      servingSizeG: map['serving_size_g'] as double?,
      fatTotalG: map['fat_total_g'] as double?,
      fatSaturatedG: map['fat_saturated_g'] as double?,
      proteinG: map['protein_g'] as int?,
      sodiumMg: map['sodium_mg'] as int?,
      potassiumMg: map['potassium_mg'] as int?,
      cholesterolMg: map['cholesterol_mg'] as int?,
      carbohydratesTotalG: map['carbohydrates_total_g'] as int?,
      fiberG: map['fiber_g'] as int?,
      sugarG: map['sugar_g'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Nutrition.fromJson(String source) =>
      Nutrition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Nutrition(name: $name, calories: $calories, servingSizeG: $servingSizeG, fatTotalG: $fatTotalG, fatSaturatedG: $fatSaturatedG, proteinG: $proteinG, sodiumMg: $sodiumMg, potassiumMg: $potassiumMg, cholesterolMg: $cholesterolMg, carbohydratesTotalG: $carbohydratesTotalG, fiberG: $fiberG, sugarG: $sugarG)';
  }

  @override
  bool operator ==(covariant Nutrition other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.calories == calories &&
        other.servingSizeG == servingSizeG &&
        other.fatTotalG == fatTotalG &&
        other.fatSaturatedG == fatSaturatedG &&
        other.proteinG == proteinG &&
        other.sodiumMg == sodiumMg &&
        other.potassiumMg == potassiumMg &&
        other.cholesterolMg == cholesterolMg &&
        other.carbohydratesTotalG == carbohydratesTotalG &&
        other.fiberG == fiberG &&
        other.sugarG == sugarG;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        calories.hashCode ^
        servingSizeG.hashCode ^
        fatTotalG.hashCode ^
        fatSaturatedG.hashCode ^
        proteinG.hashCode ^
        sodiumMg.hashCode ^
        potassiumMg.hashCode ^
        cholesterolMg.hashCode ^
        carbohydratesTotalG.hashCode ^
        fiberG.hashCode ^
        sugarG.hashCode;
  }
}
