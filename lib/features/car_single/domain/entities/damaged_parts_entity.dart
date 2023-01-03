import 'package:auto/features/car_single/data/model/damaged_parts_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DamagedPartsEntity extends Equatable {
  @JsonKey(defaultValue: '')
  final String part;
  @JsonKey(defaultValue: '')
  final String damageType;

  const DamagedPartsEntity({
    this.damageType = '',
    this.part = '',
  });

  @override
  List<Object?> get props => [
        part,
        damageType,
      ];
}

class DamagedPartsConverter<S> implements JsonConverter<DamagedPartsEntity, Map<String, dynamic>?> {
  const DamagedPartsConverter();

  @override
  DamagedPartsEntity fromJson(Map<String, dynamic>? json) => DamagedPartsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DamagedPartsEntity object) => {};
}
