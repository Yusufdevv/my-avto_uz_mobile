import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/common/domain/entity/car_modification_type_entity.dart';
import 'package:auto/features/common/domain/entity/star_answer_entity.dart';
import 'package:auto/features/common/domain/entity/type_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auto_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AutoModel extends AutoEntity {
  const AutoModel({
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

  factory AutoModel.fromJson(Map<String, dynamic> json) =>
      _$AutoModelFromJson(json);

  Map<String, dynamic> toJson() => _$AutoModelToJson(this);
}
