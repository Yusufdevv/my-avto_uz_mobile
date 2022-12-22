import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/engine_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'engine_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EngineTypeModel extends EngineTypeEntity {
  const EngineTypeModel({
    required super.id,
    required super.type,
    required super.logo,
  });

  factory EngineTypeModel.fromJson(Map<String, dynamic> json) =>
      _$EngineTypeModelFromJson(json);
}
