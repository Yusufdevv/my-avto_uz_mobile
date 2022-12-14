import 'package:auto/features/ad/data/models/engine_type.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class EngineTypeEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @JsonKey(name: 'logo', defaultValue: '')
  final String logo;

  const EngineTypeEntity({
    required this.id,
    required this.type,
    required this.logo,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        logo,
      ];
}

class EngineTypeEntityConverter
    extends JsonConverter<EngineTypeEntity, Map<String, dynamic>?> {
  const EngineTypeEntityConverter();

  @override
  EngineTypeEntity fromJson(Map<String, dynamic>? json) =>
      EngineTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(EngineTypeEntity object) => {};
}
