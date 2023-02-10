import 'package:auto/features/ad/data/models/gearbox_type.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class GearboxTypeEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @JsonKey(name: 'logo', defaultValue: '')
  final String logo;

  const GearboxTypeEntity({
     this.id =-1,
     this.type = '',
     this.logo= '',
  });

  @override
  List<Object?> get props => [
        id,
        type,
        logo,
      ];
}

class GearboxTypeEntityConverter
    extends JsonConverter<GearboxTypeEntity, Map<String, dynamic>?> {
  const GearboxTypeEntityConverter();

  @override
  GearboxTypeEntity fromJson(Map<String, dynamic>? json) =>
      GearboxTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(GearboxTypeEntity object) => {};
}
