import 'package:auto/features/reviews/data/models/result_model.dart';
import 'package:auto/features/reviews/domain/entities/generate_entity.dart';
import 'package:auto/features/reviews/domain/entities/make_entity.dart';
import 'package:auto/features/reviews/domain/entities/model_entity.dart';
import 'package:auto/features/reviews/domain/entities/modification_type_entity.dart';
import 'package:auto/features/reviews/domain/entities/star_answer_entity.dart';
import 'package:auto/features/reviews/domain/entities/type_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ResultEntity extends Equatable {
  const ResultEntity({
    this.id = 0,
    this.make = const MakeEntity(),
    this.model = const ModelEntity(),
    this.generation = const GenerateEntity(),
    this.bodyType = const TypeEntity(),
    this.driveType = const TypeEntity(),
    this.engineType = const TypeEntity(),
    this.gearboxType = const TypeEntity(),
    this.modificationType = const ModificationTypeEntity(),
    this.absoluteCarName = '',
    this.title = '',
    this.comment = '',
    this.tenure = '',
    this.positives = const [],
    this.negatives = const [],
    this.avgStar = '',
    this.starAnswers = const [],
    this.status = '',
    this.archived = false,
    this.isMine = '',
    this.viewsCount = 0,
    this.commentsCount = 0,
  });

  final int id;
  @MakeConverter()
  final MakeEntity make;
  @ModelConverter()
  final ModelEntity model;
  @GenerateConverter()
  final GenerateEntity generation;
  @TypeConverter()
  final TypeEntity bodyType;
  @TypeConverter()
  final TypeEntity driveType;
  @TypeConverter()
  final TypeEntity engineType;
  @TypeConverter()
  final TypeEntity gearboxType;
  @ModificationTypeConverter()
  final ModificationTypeEntity modificationType;
  final String absoluteCarName;
  final String title;
  final String comment;
  final String tenure;
  final List<String> positives;
  final List<String> negatives;
  final String avgStar;
  @StarAnswerConverter()
  final List<StarAnswerEntity> starAnswers;
  final String status;
  final bool archived;
  final String isMine;
  final int viewsCount;
  final int commentsCount;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        make,
        model,
        generation,
        bodyType,
        engineType,
        driveType,
        gearboxType,
        modificationType,
        absoluteCarName,
        title,
        comment,
        tenure,
        positives,
        negatives,
        avgStar,
        starAnswers,
        status,
        archived,
        isMine,
        viewsCount,
        commentsCount,
      ];
}

class ResultConverter
    implements JsonConverter<ResultEntity, Map<String, dynamic>?> {
  const ResultConverter();

  @override
  ResultEntity fromJson(Map<String, dynamic>? json) =>
      ResultModel.fromJson(json ?? {});
  @override
  Map<String, dynamic>? toJson(ResultEntity objrct) => {};
}
//     class StarAnswerConverter
//   implements JsonConverter<StarAnswerEntity, Map<String, dynamic>?> {
// const StarAnswerConverter();

// @override
// StarAnswerEntity fromJson(Map<String, dynamic>? json) =>
//     StarAnswerModel.fromJson(json ?? {});

// @override
// Map<String, dynamic>? toJson(StarAnswerEntity object) => {};
