import 'package:auto/features/ad/data/models/body_type.dart';
import 'package:auto/features/ad/data/models/modification_type.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ModificationTypeEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'power', defaultValue: '')
  final String power;
  @JsonKey(name: 'volume', defaultValue: '')
  final String volume;

  const ModificationTypeEntity({
    required this.id,
    required this.power,
    required this.volume,
  });

  @override
  List<Object?> get props => [
        id,
        power,
        volume,
      ];
}

class ModificationTypeEntityConverter
    extends JsonConverter<ModificationTypeEntity, Map<String, dynamic>?> {
  const ModificationTypeEntityConverter();

  @override
  ModificationTypeEntity fromJson(Map<String, dynamic>? json) =>
      ModificationTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(ModificationTypeEntity object) => {};
}
