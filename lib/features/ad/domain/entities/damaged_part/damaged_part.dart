import 'package:auto/features/ad/data/models/damaged_part.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DamagedPartEntity extends Equatable {
  @JsonKey(name: 'part', defaultValue: '')
  final String part;
  @JsonKey(name: 'damage_type', defaultValue: '')
  final String damageType;

  const DamagedPartEntity({
    required this.part,
    required this.damageType,
  });

  @override
  List<Object?> get props => [
        part,
        damageType,
      ];
}

class DamagedPartEntityConverter
    extends JsonConverter<DamagedPartEntity, Map<String, dynamic>?> {
  const DamagedPartEntityConverter();

  @override
  DamagedPartEntity fromJson(Map<String, dynamic>? json) =>
      DamagedPartModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DamagedPartEntity object) =>
      DamagedPartModel(damageType: object.damageType, part: object.part)
          .toJson();
}
