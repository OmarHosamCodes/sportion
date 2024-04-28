// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sportion/library.dart';

class SportModel {
  final String title;
  final String description;
  final Widget route;

  SportModel({
    required this.title,
    required this.description,
    required this.route,
  });

  SportModel copyWith({
    String? title,
    String? description,
    Widget? route,
  }) {
    return SportModel(
      title: title ?? this.title,
      description: description ?? this.description,
      route: route ?? this.route,
    );
  }

  // Football , Tennis , swimming , Gym , basketball , running
  static List<SportModel> sports = <SportModel>[
    SportModel(
      title: 'Gym',
      description:
          'Gym is a place where people go to exercise and lift weights.',
      route: const ExcerisesScreen(),
    ),
    SportModel(
      title: 'Football',
      description:
          'Football is a family of team sports that involve, to varying degrees, kicking a ball to score a goal.',
      route: const SportScreen(),
    ),
    SportModel(
      title: 'Tennis',
      description:
          'Tennis is a racket sport that can be played individually against a single opponent (singles) or between two teams of two players each (doubles).',
      route: const SportScreen(),
    ),
    SportModel(
      title: 'Swimming',
      description:
          'Swimming is an individual or team racing sport that requires the use of one\'s entire body to move through water.',
      route: const SportScreen(),
    ),
  ];
}
