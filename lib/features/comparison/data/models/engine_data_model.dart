import 'package:auto/features/comparison/domain/entities/engine_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'engine_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EngineDataModel extends EngineDataEntity {
  const EngineDataModel({
    required super.engineType,
    required super.power,
    required super.volume,
  });

  factory EngineDataModel.fromJson(Map<String, dynamic> json) =>
      _$EngineDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$EngineDataModelToJson(this);
}
