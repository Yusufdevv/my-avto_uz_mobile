import 'package:auto/features/car_single/domain/entities/engine_type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'engine_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarEngineTypeModel extends RentCarEngineTypeEntity {
  const RentCarEngineTypeModel({
    required super.id,
    required super.type,
    required super.logo,
  });
  factory RentCarEngineTypeModel.fromJson(Map<String, dynamic> json) =>
      _$RentCarEngineTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentCarEngineTypeModelToJson(this);
}
