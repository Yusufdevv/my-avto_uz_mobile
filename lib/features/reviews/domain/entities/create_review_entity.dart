import 'package:auto/features/reviews/domain/entities/star_answer_entity.dart';

class CreateReviewEntity {
  CreateReviewEntity({
    this.title = '',
    this.comment = '',
    this.tenure = '',
    this.positives = const [],
    this.negatives = const [],
    this.starAnswers = const [],
    this.make = 0,
    this.model = 0,
    this.generation = 0,
    this.bodyType = 0,
    this.driveType = 0,
    this.engineType = 0,
    this.gearboxType = 0,
    this.year = 0,
    this.modificationType = 0,
  });

  final String title;
  final String comment;
  final String tenure;
  final List<String> positives;
  final List<String> negatives;
  @StarAnswerConverter()
  final List<StarAnswerEntity> starAnswers;
  final int make;
  final int model;
  final int generation;
  final int bodyType;
  final int driveType;
  final int engineType;
  final int gearboxType;
  final int year;
  final int modificationType;
}
