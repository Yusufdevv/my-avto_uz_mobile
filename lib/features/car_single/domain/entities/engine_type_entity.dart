import 'package:auto/features/car_single/data/model/engine_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarEngineTypeEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: '')
  final String? logo;

  const RentCarEngineTypeEntity({
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

class RentCarEngineTypeConverter<S>
    implements JsonConverter<RentCarEngineTypeEntity, Map<String, dynamic>?> {
  const RentCarEngineTypeConverter();

  @override
  RentCarEngineTypeEntity fromJson(Map<String, dynamic>? json) =>
      RentCarEngineTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarEngineTypeEntity object) => {};
}
