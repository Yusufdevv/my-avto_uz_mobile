import 'package:auto/features/car_single/data/model/gearbox_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarGearboxTypeEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: '')
  final String? logo;

  const RentCarGearboxTypeEntity({
    this.id = 0,
    this.type = '',
    this.logo = '',
  });

  @override
  List<Object?> get props => [
        id,
        type,
        logo,
      ];
}

class RentCarGearboxTypeConverter<S> implements JsonConverter<RentCarGearboxTypeEntity, Map<String, dynamic>?> {
  const RentCarGearboxTypeConverter();

  @override
  RentCarGearboxTypeEntity fromJson(Map<String, dynamic>? json) => RentCarGearboxTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarGearboxTypeEntity object) => {};
}
