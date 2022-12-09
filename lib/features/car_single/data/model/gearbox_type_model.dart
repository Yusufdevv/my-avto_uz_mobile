import 'package:auto/features/car_single/domain/entities/gearbox_type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gearbox_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarGearboxTypeModel extends RentCarGearboxTypeEntity {
  const RentCarGearboxTypeModel({
    required super.id,
    required super.type,
    required super.logo,
  });
  factory RentCarGearboxTypeModel.fromJson(Map<String, dynamic> json) => _$RentCarGearboxTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentCarGearboxTypeModelToJson(this);
}
