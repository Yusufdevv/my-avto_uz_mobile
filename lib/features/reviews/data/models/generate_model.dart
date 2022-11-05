import 'package:auto/features/reviews/domain/entities/generate_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generate_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenerateModel extends GenerateEntity {
  GenerateModel({
    required super.id,
    required super.logo,
    required super.model,
    required super.name,
    required super.yearBegin,
    required super.yearEnd,
  });

  factory GenerateModel.fromJson(Map<String, dynamic> json) =>
      _$GenerateModelFromJson(json);
  Map<String, dynamic> toJson() => _$GenerateModelToJson(this);
}
