import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/common/domain/entity/car_modification_type_entity.dart';
import 'package:auto/features/common/domain/entity/star_answer_entity.dart';
import 'package:auto/features/common/domain/entity/type_entity.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AutoEntity extends Equatable {
  const AutoEntity({
    this.id = -1,
    this.make = const CarMakeEntity(),
    this.model = const CarModelEntity(),
    this.generation = const CarGenerationEntity(),
    this.bodyType = const TypeEntity(),
    this.driveType = const TypeEntity(),
    this.engineType = const TypeEntity(),
    this.gearboxType = const TypeEntity(),
    this.modificationType = const CarModificationTypeEntity(),
    this.absoluteCarName = '',
    this.title = '',
    this.comment = '',
    this.tenure = '',
    this.positives = const [],
    this.negatives = const [],
    this.avgStar = 0,
    this.starAnswers = const [],
    this.status = '',
    this.archived = false,
    this.isMine = false,
    this.viewsCount = 0,
    this.commentsCount = 0,
  });

  final int id;
  @CarMakeConverter()
  final CarMakeEntity make;
  @CarModelConverter()
  final CarModelEntity model;
  @CarGenerationConverter()
  final CarGenerationEntity generation;
  @TypeConverter()
  final TypeEntity bodyType;
  @TypeConverter()
  final TypeEntity driveType;
  @TypeConverter()
  final TypeEntity engineType;
  @TypeConverter()
  final TypeEntity gearboxType;
  @CarModificationTypeConverter()
  final CarModificationTypeEntity modificationType;
  final String absoluteCarName;
  final String title;
  final String comment;
  final String tenure;
  final List<String> positives;
  final List<String> negatives;
  final double avgStar;
  @StarAnswerConverter()
  final List<StarAnswerEntity> starAnswers;
  final String status;
  final bool archived;
  final bool isMine;
  final int viewsCount;
  final int commentsCount;

  @override
  List<Object?> get props => [
        id,
        make,
        model,
        generation,
        bodyType,
        driveType,
        engineType,
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

class AutoConverter
    implements JsonConverter<AutoEntity, Map<String, dynamic>?> {
  const AutoConverter();
  @override
  AutoEntity fromJson(Map<String, dynamic>? json) =>
      AutoModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(AutoEntity object) => AutoModel(
        id: object.id,
        absoluteCarName: object.absoluteCarName,
        archived: object.archived,
        avgStar: object.avgStar,
        bodyType: object.bodyType,
        comment: object.comment,
        commentsCount: object.commentsCount,
        driveType: object.driveType,
        engineType: object.engineType,
        gearboxType: object.gearboxType,
        generation: object.generation,
        isMine: object.isMine,
        make: object.make,
        model: object.model,
        modificationType: object.modificationType,
        negatives: object.negatives,
        positives: object.positives,
        starAnswers: object.starAnswers,
        status: object.status,
        tenure: object.tenure,
        title: object.title,
        viewsCount: object.viewsCount,
      ).toJson();
}
