import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gearbox_type.g.dart';

@JsonSerializable()
class GearboxTypeModel extends GearboxTypeEntity {
  const GearboxTypeModel({
    required super.id,
    required super.type,
    required super.logo,
  });

  factory GearboxTypeModel.fromJson(Map<String, dynamic> json) =>
      _$GearboxTypeModelFromJson(json);
}
