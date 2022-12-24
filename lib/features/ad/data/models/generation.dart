import 'package:auto/features/ad/domain/entities/generation/generation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenerationModel extends GenerationEntity {
  const GenerationModel({
    required super.id,
    required super.name,
    required super.yearBegin,
    required super.yearEnd,
    required super.modelId,
    required super.logo,
  });

  factory GenerationModel.fromJson(Map<String, dynamic> json) =>
      _$GenerationModelFromJson(json);
}
