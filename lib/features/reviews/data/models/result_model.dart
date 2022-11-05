import 'package:auto/features/reviews/domain/entities/result_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResultModel extends ResultEntity {
  const ResultModel({
    required super.id,
    required super.absoluteCarName,
    required super.archived,
    required super.avgStar,
    required super.bodyType,
    required super.comment,
    required super.commentsCount,
    required super.driveType,
    required super.engineType,
    required super.gearboxType,
    required super.generation,
    required super.isMine,
    required super.make,
    required super.model,
    required super.modificationType,
    required super.negatives,
    required super.positives,
    required super.starAnswers,
    required super.status,
    required super.tenure,
    required super.title,
    required super.viewsCount,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
