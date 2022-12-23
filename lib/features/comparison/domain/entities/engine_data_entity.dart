import 'package:auto/features/comparison/data/models/engine_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class EngineDataEntity extends Equatable {
  const EngineDataEntity({
    this.engineType = '',
    this.power = '',
    this.volume = '',
  });

  final String engineType;
  final String power;
  final String volume;

  @override
  List<Object?> get props => [engineType, power, volume];
}

class EngineDataConverter
    implements JsonConverter<EngineDataEntity, Map<String, dynamic>?> {
  const EngineDataConverter();
  @override
  EngineDataEntity fromJson(Map<String, dynamic>? json) =>
      EngineDataModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(EngineDataEntity object) => {};
}
