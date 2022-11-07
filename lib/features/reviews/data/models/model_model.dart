import 'package:auto/features/reviews/domain/entities/model_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ModelModel extends ModelEntity {
  ModelModel({
    required super.id,
    required super.make,
    required super.name,
  });

  factory ModelModel.fromJson(Map<String, dynamic> json) =>
      _$ModelModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelModelToJson(this);
}
